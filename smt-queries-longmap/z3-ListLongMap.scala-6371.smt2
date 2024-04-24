; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82130 () Bool)

(assert start!82130)

(declare-fun b!956944 () Bool)

(declare-fun res!640545 () Bool)

(declare-fun e!539199 () Bool)

(assert (=> b!956944 (=> (not res!640545) (not e!539199))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-datatypes ((array!58150 0))(
  ( (array!58151 (arr!27950 (Array (_ BitVec 32) (_ BitVec 64))) (size!28430 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58150)

(declare-datatypes ((V!32985 0))(
  ( (V!32986 (val!10551 Int)) )
))
(declare-datatypes ((ValueCell!10019 0))(
  ( (ValueCellFull!10019 (v!13103 V!32985)) (EmptyCell!10019) )
))
(declare-datatypes ((array!58152 0))(
  ( (array!58153 (arr!27951 (Array (_ BitVec 32) ValueCell!10019)) (size!28431 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58152)

(declare-fun mask!1823 () (_ BitVec 32))

(assert (=> b!956944 (= res!640545 (and (= (size!28431 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28430 _keys!1441) (size!28431 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!956945 () Bool)

(assert (=> b!956945 (= e!539199 false)))

(declare-fun lt!430440 () Bool)

(declare-datatypes ((List!19462 0))(
  ( (Nil!19459) (Cons!19458 (h!20626 (_ BitVec 64)) (t!27815 List!19462)) )
))
(declare-fun arrayNoDuplicates!0 (array!58150 (_ BitVec 32) List!19462) Bool)

(assert (=> b!956945 (= lt!430440 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19459))))

(declare-fun mapNonEmpty!33463 () Bool)

(declare-fun mapRes!33463 () Bool)

(declare-fun tp!64042 () Bool)

(declare-fun e!539198 () Bool)

(assert (=> mapNonEmpty!33463 (= mapRes!33463 (and tp!64042 e!539198))))

(declare-fun mapKey!33463 () (_ BitVec 32))

(declare-fun mapRest!33463 () (Array (_ BitVec 32) ValueCell!10019))

(declare-fun mapValue!33463 () ValueCell!10019)

(assert (=> mapNonEmpty!33463 (= (arr!27951 _values!1197) (store mapRest!33463 mapKey!33463 mapValue!33463))))

(declare-fun b!956946 () Bool)

(declare-fun e!539197 () Bool)

(declare-fun e!539196 () Bool)

(assert (=> b!956946 (= e!539197 (and e!539196 mapRes!33463))))

(declare-fun condMapEmpty!33463 () Bool)

(declare-fun mapDefault!33463 () ValueCell!10019)

(assert (=> b!956946 (= condMapEmpty!33463 (= (arr!27951 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!10019)) mapDefault!33463)))))

(declare-fun b!956947 () Bool)

(declare-fun res!640546 () Bool)

(assert (=> b!956947 (=> (not res!640546) (not e!539199))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58150 (_ BitVec 32)) Bool)

(assert (=> b!956947 (= res!640546 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!956948 () Bool)

(declare-fun tp_is_empty!21001 () Bool)

(assert (=> b!956948 (= e!539198 tp_is_empty!21001)))

(declare-fun b!956949 () Bool)

(assert (=> b!956949 (= e!539196 tp_is_empty!21001)))

(declare-fun res!640547 () Bool)

(assert (=> start!82130 (=> (not res!640547) (not e!539199))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82130 (= res!640547 (validMask!0 mask!1823))))

(assert (=> start!82130 e!539199))

(assert (=> start!82130 true))

(declare-fun array_inv!21765 (array!58152) Bool)

(assert (=> start!82130 (and (array_inv!21765 _values!1197) e!539197)))

(declare-fun array_inv!21766 (array!58150) Bool)

(assert (=> start!82130 (array_inv!21766 _keys!1441)))

(declare-fun mapIsEmpty!33463 () Bool)

(assert (=> mapIsEmpty!33463 mapRes!33463))

(assert (= (and start!82130 res!640547) b!956944))

(assert (= (and b!956944 res!640545) b!956947))

(assert (= (and b!956947 res!640546) b!956945))

(assert (= (and b!956946 condMapEmpty!33463) mapIsEmpty!33463))

(assert (= (and b!956946 (not condMapEmpty!33463)) mapNonEmpty!33463))

(get-info :version)

(assert (= (and mapNonEmpty!33463 ((_ is ValueCellFull!10019) mapValue!33463)) b!956948))

(assert (= (and b!956946 ((_ is ValueCellFull!10019) mapDefault!33463)) b!956949))

(assert (= start!82130 b!956946))

(declare-fun m!888747 () Bool)

(assert (=> b!956945 m!888747))

(declare-fun m!888749 () Bool)

(assert (=> mapNonEmpty!33463 m!888749))

(declare-fun m!888751 () Bool)

(assert (=> b!956947 m!888751))

(declare-fun m!888753 () Bool)

(assert (=> start!82130 m!888753))

(declare-fun m!888755 () Bool)

(assert (=> start!82130 m!888755))

(declare-fun m!888757 () Bool)

(assert (=> start!82130 m!888757))

(check-sat (not start!82130) (not b!956945) (not b!956947) (not mapNonEmpty!33463) tp_is_empty!21001)
(check-sat)
