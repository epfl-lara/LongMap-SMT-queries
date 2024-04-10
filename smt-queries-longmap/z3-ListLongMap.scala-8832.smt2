; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107218 () Bool)

(assert start!107218)

(declare-fun b!1270985 () Bool)

(declare-fun e!724638 () Bool)

(declare-fun tp_is_empty!32907 () Bool)

(assert (=> b!1270985 (= e!724638 tp_is_empty!32907)))

(declare-fun b!1270986 () Bool)

(declare-fun res!845686 () Bool)

(declare-fun e!724637 () Bool)

(assert (=> b!1270986 (=> (not res!845686) (not e!724637))))

(declare-datatypes ((array!83070 0))(
  ( (array!83071 (arr!40072 (Array (_ BitVec 32) (_ BitVec 64))) (size!40608 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83070)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83070 (_ BitVec 32)) Bool)

(assert (=> b!1270986 (= res!845686 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1270987 () Bool)

(declare-fun res!845685 () Bool)

(assert (=> b!1270987 (=> (not res!845685) (not e!724637))))

(declare-datatypes ((V!49069 0))(
  ( (V!49070 (val!16528 Int)) )
))
(declare-datatypes ((ValueCell!15600 0))(
  ( (ValueCellFull!15600 (v!19165 V!49069)) (EmptyCell!15600) )
))
(declare-datatypes ((array!83072 0))(
  ( (array!83073 (arr!40073 (Array (_ BitVec 32) ValueCell!15600)) (size!40609 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83072)

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(assert (=> b!1270987 (= res!845685 (and (= (size!40609 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40608 _keys!1364) (size!40609 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun res!845687 () Bool)

(assert (=> start!107218 (=> (not res!845687) (not e!724637))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107218 (= res!845687 (validMask!0 mask!1730))))

(assert (=> start!107218 e!724637))

(declare-fun e!724635 () Bool)

(declare-fun array_inv!30479 (array!83072) Bool)

(assert (=> start!107218 (and (array_inv!30479 _values!1134) e!724635)))

(assert (=> start!107218 true))

(declare-fun array_inv!30480 (array!83070) Bool)

(assert (=> start!107218 (array_inv!30480 _keys!1364)))

(declare-fun mapNonEmpty!50941 () Bool)

(declare-fun mapRes!50941 () Bool)

(declare-fun tp!97282 () Bool)

(assert (=> mapNonEmpty!50941 (= mapRes!50941 (and tp!97282 e!724638))))

(declare-fun mapRest!50941 () (Array (_ BitVec 32) ValueCell!15600))

(declare-fun mapKey!50941 () (_ BitVec 32))

(declare-fun mapValue!50941 () ValueCell!15600)

(assert (=> mapNonEmpty!50941 (= (arr!40073 _values!1134) (store mapRest!50941 mapKey!50941 mapValue!50941))))

(declare-fun b!1270988 () Bool)

(assert (=> b!1270988 (= e!724637 false)))

(declare-fun lt!574797 () Bool)

(declare-datatypes ((List!28508 0))(
  ( (Nil!28505) (Cons!28504 (h!29713 (_ BitVec 64)) (t!42037 List!28508)) )
))
(declare-fun arrayNoDuplicates!0 (array!83070 (_ BitVec 32) List!28508) Bool)

(assert (=> b!1270988 (= lt!574797 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28505))))

(declare-fun b!1270989 () Bool)

(declare-fun e!724636 () Bool)

(assert (=> b!1270989 (= e!724635 (and e!724636 mapRes!50941))))

(declare-fun condMapEmpty!50941 () Bool)

(declare-fun mapDefault!50941 () ValueCell!15600)

(assert (=> b!1270989 (= condMapEmpty!50941 (= (arr!40073 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15600)) mapDefault!50941)))))

(declare-fun mapIsEmpty!50941 () Bool)

(assert (=> mapIsEmpty!50941 mapRes!50941))

(declare-fun b!1270990 () Bool)

(assert (=> b!1270990 (= e!724636 tp_is_empty!32907)))

(assert (= (and start!107218 res!845687) b!1270987))

(assert (= (and b!1270987 res!845685) b!1270986))

(assert (= (and b!1270986 res!845686) b!1270988))

(assert (= (and b!1270989 condMapEmpty!50941) mapIsEmpty!50941))

(assert (= (and b!1270989 (not condMapEmpty!50941)) mapNonEmpty!50941))

(get-info :version)

(assert (= (and mapNonEmpty!50941 ((_ is ValueCellFull!15600) mapValue!50941)) b!1270985))

(assert (= (and b!1270989 ((_ is ValueCellFull!15600) mapDefault!50941)) b!1270990))

(assert (= start!107218 b!1270989))

(declare-fun m!1169087 () Bool)

(assert (=> b!1270986 m!1169087))

(declare-fun m!1169089 () Bool)

(assert (=> start!107218 m!1169089))

(declare-fun m!1169091 () Bool)

(assert (=> start!107218 m!1169091))

(declare-fun m!1169093 () Bool)

(assert (=> start!107218 m!1169093))

(declare-fun m!1169095 () Bool)

(assert (=> mapNonEmpty!50941 m!1169095))

(declare-fun m!1169097 () Bool)

(assert (=> b!1270988 m!1169097))

(check-sat tp_is_empty!32907 (not start!107218) (not b!1270988) (not mapNonEmpty!50941) (not b!1270986))
(check-sat)
