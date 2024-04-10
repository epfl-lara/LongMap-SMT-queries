; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35806 () Bool)

(assert start!35806)

(declare-fun b!359642 () Bool)

(declare-fun res!199882 () Bool)

(declare-fun e!220319 () Bool)

(assert (=> b!359642 (=> (not res!199882) (not e!220319))))

(declare-datatypes ((array!20071 0))(
  ( (array!20072 (arr!9529 (Array (_ BitVec 32) (_ BitVec 64))) (size!9881 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20071)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20071 (_ BitVec 32)) Bool)

(assert (=> b!359642 (= res!199882 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!359643 () Bool)

(declare-fun e!220321 () Bool)

(declare-fun tp_is_empty!8259 () Bool)

(assert (=> b!359643 (= e!220321 tp_is_empty!8259)))

(declare-fun mapIsEmpty!13896 () Bool)

(declare-fun mapRes!13896 () Bool)

(assert (=> mapIsEmpty!13896 mapRes!13896))

(declare-fun res!199881 () Bool)

(assert (=> start!35806 (=> (not res!199881) (not e!220319))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35806 (= res!199881 (validMask!0 mask!1842))))

(assert (=> start!35806 e!220319))

(assert (=> start!35806 true))

(declare-datatypes ((V!11989 0))(
  ( (V!11990 (val!4174 Int)) )
))
(declare-datatypes ((ValueCell!3786 0))(
  ( (ValueCellFull!3786 (v!6368 V!11989)) (EmptyCell!3786) )
))
(declare-datatypes ((array!20073 0))(
  ( (array!20074 (arr!9530 (Array (_ BitVec 32) ValueCell!3786)) (size!9882 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20073)

(declare-fun e!220322 () Bool)

(declare-fun array_inv!7008 (array!20073) Bool)

(assert (=> start!35806 (and (array_inv!7008 _values!1208) e!220322)))

(declare-fun array_inv!7009 (array!20071) Bool)

(assert (=> start!35806 (array_inv!7009 _keys!1456)))

(declare-fun b!359644 () Bool)

(declare-fun res!199880 () Bool)

(assert (=> b!359644 (=> (not res!199880) (not e!220319))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!359644 (= res!199880 (and (= (size!9882 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9881 _keys!1456) (size!9882 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!359645 () Bool)

(assert (=> b!359645 (= e!220319 false)))

(declare-fun lt!166376 () Bool)

(declare-datatypes ((List!5474 0))(
  ( (Nil!5471) (Cons!5470 (h!6326 (_ BitVec 64)) (t!10624 List!5474)) )
))
(declare-fun arrayNoDuplicates!0 (array!20071 (_ BitVec 32) List!5474) Bool)

(assert (=> b!359645 (= lt!166376 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5471))))

(declare-fun b!359646 () Bool)

(assert (=> b!359646 (= e!220322 (and e!220321 mapRes!13896))))

(declare-fun condMapEmpty!13896 () Bool)

(declare-fun mapDefault!13896 () ValueCell!3786)

(assert (=> b!359646 (= condMapEmpty!13896 (= (arr!9530 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3786)) mapDefault!13896)))))

(declare-fun mapNonEmpty!13896 () Bool)

(declare-fun tp!27963 () Bool)

(declare-fun e!220318 () Bool)

(assert (=> mapNonEmpty!13896 (= mapRes!13896 (and tp!27963 e!220318))))

(declare-fun mapKey!13896 () (_ BitVec 32))

(declare-fun mapValue!13896 () ValueCell!3786)

(declare-fun mapRest!13896 () (Array (_ BitVec 32) ValueCell!3786))

(assert (=> mapNonEmpty!13896 (= (arr!9530 _values!1208) (store mapRest!13896 mapKey!13896 mapValue!13896))))

(declare-fun b!359647 () Bool)

(assert (=> b!359647 (= e!220318 tp_is_empty!8259)))

(assert (= (and start!35806 res!199881) b!359644))

(assert (= (and b!359644 res!199880) b!359642))

(assert (= (and b!359642 res!199882) b!359645))

(assert (= (and b!359646 condMapEmpty!13896) mapIsEmpty!13896))

(assert (= (and b!359646 (not condMapEmpty!13896)) mapNonEmpty!13896))

(get-info :version)

(assert (= (and mapNonEmpty!13896 ((_ is ValueCellFull!3786) mapValue!13896)) b!359647))

(assert (= (and b!359646 ((_ is ValueCellFull!3786) mapDefault!13896)) b!359643))

(assert (= start!35806 b!359646))

(declare-fun m!357079 () Bool)

(assert (=> b!359642 m!357079))

(declare-fun m!357081 () Bool)

(assert (=> start!35806 m!357081))

(declare-fun m!357083 () Bool)

(assert (=> start!35806 m!357083))

(declare-fun m!357085 () Bool)

(assert (=> start!35806 m!357085))

(declare-fun m!357087 () Bool)

(assert (=> b!359645 m!357087))

(declare-fun m!357089 () Bool)

(assert (=> mapNonEmpty!13896 m!357089))

(check-sat (not b!359642) (not b!359645) (not start!35806) (not mapNonEmpty!13896) tp_is_empty!8259)
(check-sat)
