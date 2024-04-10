; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97032 () Bool)

(assert start!97032)

(declare-fun res!736301 () Bool)

(declare-fun e!630035 () Bool)

(assert (=> start!97032 (=> (not res!736301) (not e!630035))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!71565 0))(
  ( (array!71566 (arr!34439 (Array (_ BitVec 32) (_ BitVec 64))) (size!34975 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71565)

(assert (=> start!97032 (= res!736301 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!34975 _keys!1208))))))

(assert (=> start!97032 e!630035))

(declare-fun array_inv!26520 (array!71565) Bool)

(assert (=> start!97032 (array_inv!26520 _keys!1208)))

(assert (=> start!97032 true))

(declare-datatypes ((V!41555 0))(
  ( (V!41556 (val!13717 Int)) )
))
(declare-datatypes ((ValueCell!12951 0))(
  ( (ValueCellFull!12951 (v!16349 V!41555)) (EmptyCell!12951) )
))
(declare-datatypes ((array!71567 0))(
  ( (array!71568 (arr!34440 (Array (_ BitVec 32) ValueCell!12951)) (size!34976 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71567)

(declare-fun e!630034 () Bool)

(declare-fun array_inv!26521 (array!71567) Bool)

(assert (=> start!97032 (and (array_inv!26521 _values!996) e!630034)))

(declare-fun b!1103669 () Bool)

(declare-fun e!630033 () Bool)

(declare-fun mapRes!42787 () Bool)

(assert (=> b!1103669 (= e!630034 (and e!630033 mapRes!42787))))

(declare-fun condMapEmpty!42787 () Bool)

(declare-fun mapDefault!42787 () ValueCell!12951)

(assert (=> b!1103669 (= condMapEmpty!42787 (= (arr!34440 _values!996) ((as const (Array (_ BitVec 32) ValueCell!12951)) mapDefault!42787)))))

(declare-fun b!1103670 () Bool)

(declare-fun res!736300 () Bool)

(assert (=> b!1103670 (=> (not res!736300) (not e!630035))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1103670 (= res!736300 (and (= (size!34976 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!34975 _keys!1208) (size!34976 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1103671 () Bool)

(declare-fun e!630032 () Bool)

(declare-fun tp_is_empty!27321 () Bool)

(assert (=> b!1103671 (= e!630032 tp_is_empty!27321)))

(declare-fun mapIsEmpty!42787 () Bool)

(assert (=> mapIsEmpty!42787 mapRes!42787))

(declare-fun b!1103672 () Bool)

(declare-fun res!736299 () Bool)

(assert (=> b!1103672 (=> (not res!736299) (not e!630035))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1103672 (= res!736299 (validMask!0 mask!1564))))

(declare-fun b!1103673 () Bool)

(assert (=> b!1103673 (= e!630033 tp_is_empty!27321)))

(declare-fun mapNonEmpty!42787 () Bool)

(declare-fun tp!81707 () Bool)

(assert (=> mapNonEmpty!42787 (= mapRes!42787 (and tp!81707 e!630032))))

(declare-fun mapValue!42787 () ValueCell!12951)

(declare-fun mapKey!42787 () (_ BitVec 32))

(declare-fun mapRest!42787 () (Array (_ BitVec 32) ValueCell!12951))

(assert (=> mapNonEmpty!42787 (= (arr!34440 _values!996) (store mapRest!42787 mapKey!42787 mapValue!42787))))

(declare-fun b!1103674 () Bool)

(declare-fun res!736302 () Bool)

(assert (=> b!1103674 (=> (not res!736302) (not e!630035))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71565 (_ BitVec 32)) Bool)

(assert (=> b!1103674 (= res!736302 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1103675 () Bool)

(assert (=> b!1103675 (= e!630035 false)))

(declare-fun lt!495088 () Bool)

(declare-datatypes ((List!24045 0))(
  ( (Nil!24042) (Cons!24041 (h!25250 (_ BitVec 64)) (t!34310 List!24045)) )
))
(declare-fun arrayNoDuplicates!0 (array!71565 (_ BitVec 32) List!24045) Bool)

(assert (=> b!1103675 (= lt!495088 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24042))))

(assert (= (and start!97032 res!736301) b!1103672))

(assert (= (and b!1103672 res!736299) b!1103670))

(assert (= (and b!1103670 res!736300) b!1103674))

(assert (= (and b!1103674 res!736302) b!1103675))

(assert (= (and b!1103669 condMapEmpty!42787) mapIsEmpty!42787))

(assert (= (and b!1103669 (not condMapEmpty!42787)) mapNonEmpty!42787))

(get-info :version)

(assert (= (and mapNonEmpty!42787 ((_ is ValueCellFull!12951) mapValue!42787)) b!1103671))

(assert (= (and b!1103669 ((_ is ValueCellFull!12951) mapDefault!42787)) b!1103673))

(assert (= start!97032 b!1103669))

(declare-fun m!1023729 () Bool)

(assert (=> b!1103674 m!1023729))

(declare-fun m!1023731 () Bool)

(assert (=> b!1103675 m!1023731))

(declare-fun m!1023733 () Bool)

(assert (=> mapNonEmpty!42787 m!1023733))

(declare-fun m!1023735 () Bool)

(assert (=> b!1103672 m!1023735))

(declare-fun m!1023737 () Bool)

(assert (=> start!97032 m!1023737))

(declare-fun m!1023739 () Bool)

(assert (=> start!97032 m!1023739))

(check-sat tp_is_empty!27321 (not b!1103674) (not start!97032) (not mapNonEmpty!42787) (not b!1103675) (not b!1103672))
(check-sat)
