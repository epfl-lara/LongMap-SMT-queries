; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20446 () Bool)

(assert start!20446)

(declare-fun b_free!5101 () Bool)

(declare-fun b_next!5101 () Bool)

(assert (=> start!20446 (= b_free!5101 (not b_next!5101))))

(declare-fun tp!18335 () Bool)

(declare-fun b_and!11861 () Bool)

(assert (=> start!20446 (= tp!18335 b_and!11861)))

(declare-fun b!202502 () Bool)

(declare-fun e!132635 () Bool)

(declare-fun tp_is_empty!4957 () Bool)

(assert (=> b!202502 (= e!132635 tp_is_empty!4957)))

(declare-fun mapNonEmpty!8504 () Bool)

(declare-fun mapRes!8504 () Bool)

(declare-fun tp!18334 () Bool)

(declare-fun e!132638 () Bool)

(assert (=> mapNonEmpty!8504 (= mapRes!8504 (and tp!18334 e!132638))))

(declare-datatypes ((V!6257 0))(
  ( (V!6258 (val!2523 Int)) )
))
(declare-datatypes ((ValueCell!2135 0))(
  ( (ValueCellFull!2135 (v!4494 V!6257)) (EmptyCell!2135) )
))
(declare-fun mapValue!8504 () ValueCell!2135)

(declare-datatypes ((array!9131 0))(
  ( (array!9132 (arr!4316 (Array (_ BitVec 32) ValueCell!2135)) (size!4641 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9131)

(declare-fun mapKey!8504 () (_ BitVec 32))

(declare-fun mapRest!8504 () (Array (_ BitVec 32) ValueCell!2135))

(assert (=> mapNonEmpty!8504 (= (arr!4316 _values!649) (store mapRest!8504 mapKey!8504 mapValue!8504))))

(declare-fun b!202503 () Bool)

(declare-fun res!97045 () Bool)

(declare-fun e!132636 () Bool)

(assert (=> b!202503 (=> (not res!97045) (not e!132636))))

(declare-datatypes ((array!9133 0))(
  ( (array!9134 (arr!4317 (Array (_ BitVec 32) (_ BitVec 64))) (size!4642 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9133)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!202503 (= res!97045 (and (= (size!4641 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4642 _keys!825) (size!4641 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!202505 () Bool)

(declare-fun e!132632 () Bool)

(assert (=> b!202505 (= e!132636 (not e!132632))))

(declare-fun res!97040 () Bool)

(assert (=> b!202505 (=> res!97040 e!132632)))

(assert (=> b!202505 (= res!97040 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!3760 0))(
  ( (tuple2!3761 (_1!1891 (_ BitVec 64)) (_2!1891 V!6257)) )
))
(declare-datatypes ((List!2667 0))(
  ( (Nil!2664) (Cons!2663 (h!3305 tuple2!3760) (t!7590 List!2667)) )
))
(declare-datatypes ((ListLongMap!2675 0))(
  ( (ListLongMap!2676 (toList!1353 List!2667)) )
))
(declare-fun lt!101692 () ListLongMap!2675)

(declare-fun zeroValue!615 () V!6257)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6257)

(declare-fun getCurrentListMap!937 (array!9133 array!9131 (_ BitVec 32) (_ BitVec 32) V!6257 V!6257 (_ BitVec 32) Int) ListLongMap!2675)

(assert (=> b!202505 (= lt!101692 (getCurrentListMap!937 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!101693 () array!9131)

(declare-fun lt!101700 () ListLongMap!2675)

(assert (=> b!202505 (= lt!101700 (getCurrentListMap!937 _keys!825 lt!101693 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!101702 () ListLongMap!2675)

(declare-fun lt!101695 () ListLongMap!2675)

(assert (=> b!202505 (and (= lt!101702 lt!101695) (= lt!101695 lt!101702))))

(declare-fun lt!101698 () ListLongMap!2675)

(declare-fun lt!101694 () tuple2!3760)

(declare-fun +!407 (ListLongMap!2675 tuple2!3760) ListLongMap!2675)

(assert (=> b!202505 (= lt!101695 (+!407 lt!101698 lt!101694))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun v!520 () V!6257)

(assert (=> b!202505 (= lt!101694 (tuple2!3761 k0!843 v!520))))

(declare-datatypes ((Unit!6098 0))(
  ( (Unit!6099) )
))
(declare-fun lt!101691 () Unit!6098)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!73 (array!9133 array!9131 (_ BitVec 32) (_ BitVec 32) V!6257 V!6257 (_ BitVec 32) (_ BitVec 64) V!6257 (_ BitVec 32) Int) Unit!6098)

(assert (=> b!202505 (= lt!101691 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!73 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!330 (array!9133 array!9131 (_ BitVec 32) (_ BitVec 32) V!6257 V!6257 (_ BitVec 32) Int) ListLongMap!2675)

(assert (=> b!202505 (= lt!101702 (getCurrentListMapNoExtraKeys!330 _keys!825 lt!101693 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!202505 (= lt!101693 (array!9132 (store (arr!4316 _values!649) i!601 (ValueCellFull!2135 v!520)) (size!4641 _values!649)))))

(assert (=> b!202505 (= lt!101698 (getCurrentListMapNoExtraKeys!330 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!202506 () Bool)

(declare-fun res!97043 () Bool)

(assert (=> b!202506 (=> (not res!97043) (not e!132636))))

(declare-datatypes ((List!2668 0))(
  ( (Nil!2665) (Cons!2664 (h!3306 (_ BitVec 64)) (t!7591 List!2668)) )
))
(declare-fun arrayNoDuplicates!0 (array!9133 (_ BitVec 32) List!2668) Bool)

(assert (=> b!202506 (= res!97043 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2665))))

(declare-fun b!202507 () Bool)

(declare-fun e!132634 () Bool)

(assert (=> b!202507 (= e!132634 true)))

(declare-fun lt!101696 () ListLongMap!2675)

(declare-fun lt!101697 () ListLongMap!2675)

(assert (=> b!202507 (= lt!101696 (+!407 lt!101697 lt!101694))))

(declare-fun lt!101699 () Unit!6098)

(declare-fun addCommutativeForDiffKeys!127 (ListLongMap!2675 (_ BitVec 64) V!6257 (_ BitVec 64) V!6257) Unit!6098)

(assert (=> b!202507 (= lt!101699 (addCommutativeForDiffKeys!127 lt!101698 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!202508 () Bool)

(assert (=> b!202508 (= e!132638 tp_is_empty!4957)))

(declare-fun b!202509 () Bool)

(declare-fun res!97037 () Bool)

(assert (=> b!202509 (=> (not res!97037) (not e!132636))))

(assert (=> b!202509 (= res!97037 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4642 _keys!825))))))

(declare-fun mapIsEmpty!8504 () Bool)

(assert (=> mapIsEmpty!8504 mapRes!8504))

(declare-fun b!202510 () Bool)

(declare-fun res!97042 () Bool)

(assert (=> b!202510 (=> (not res!97042) (not e!132636))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9133 (_ BitVec 32)) Bool)

(assert (=> b!202510 (= res!97042 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!202511 () Bool)

(declare-fun res!97041 () Bool)

(assert (=> b!202511 (=> (not res!97041) (not e!132636))))

(assert (=> b!202511 (= res!97041 (= (select (arr!4317 _keys!825) i!601) k0!843))))

(declare-fun res!97038 () Bool)

(assert (=> start!20446 (=> (not res!97038) (not e!132636))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20446 (= res!97038 (validMask!0 mask!1149))))

(assert (=> start!20446 e!132636))

(declare-fun e!132633 () Bool)

(declare-fun array_inv!2815 (array!9131) Bool)

(assert (=> start!20446 (and (array_inv!2815 _values!649) e!132633)))

(assert (=> start!20446 true))

(assert (=> start!20446 tp_is_empty!4957))

(declare-fun array_inv!2816 (array!9133) Bool)

(assert (=> start!20446 (array_inv!2816 _keys!825)))

(assert (=> start!20446 tp!18335))

(declare-fun b!202504 () Bool)

(assert (=> b!202504 (= e!132632 e!132634)))

(declare-fun res!97039 () Bool)

(assert (=> b!202504 (=> res!97039 e!132634)))

(assert (=> b!202504 (= res!97039 (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!202504 (= lt!101700 lt!101696)))

(declare-fun lt!101701 () tuple2!3760)

(assert (=> b!202504 (= lt!101696 (+!407 lt!101695 lt!101701))))

(assert (=> b!202504 (= lt!101692 lt!101697)))

(assert (=> b!202504 (= lt!101697 (+!407 lt!101698 lt!101701))))

(assert (=> b!202504 (= lt!101700 (+!407 lt!101702 lt!101701))))

(assert (=> b!202504 (= lt!101701 (tuple2!3761 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!202512 () Bool)

(declare-fun res!97044 () Bool)

(assert (=> b!202512 (=> (not res!97044) (not e!132636))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!202512 (= res!97044 (validKeyInArray!0 k0!843))))

(declare-fun b!202513 () Bool)

(assert (=> b!202513 (= e!132633 (and e!132635 mapRes!8504))))

(declare-fun condMapEmpty!8504 () Bool)

(declare-fun mapDefault!8504 () ValueCell!2135)

(assert (=> b!202513 (= condMapEmpty!8504 (= (arr!4316 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2135)) mapDefault!8504)))))

(assert (= (and start!20446 res!97038) b!202503))

(assert (= (and b!202503 res!97045) b!202510))

(assert (= (and b!202510 res!97042) b!202506))

(assert (= (and b!202506 res!97043) b!202509))

(assert (= (and b!202509 res!97037) b!202512))

(assert (= (and b!202512 res!97044) b!202511))

(assert (= (and b!202511 res!97041) b!202505))

(assert (= (and b!202505 (not res!97040)) b!202504))

(assert (= (and b!202504 (not res!97039)) b!202507))

(assert (= (and b!202513 condMapEmpty!8504) mapIsEmpty!8504))

(assert (= (and b!202513 (not condMapEmpty!8504)) mapNonEmpty!8504))

(get-info :version)

(assert (= (and mapNonEmpty!8504 ((_ is ValueCellFull!2135) mapValue!8504)) b!202508))

(assert (= (and b!202513 ((_ is ValueCellFull!2135) mapDefault!8504)) b!202502))

(assert (= start!20446 b!202513))

(declare-fun m!229953 () Bool)

(assert (=> b!202512 m!229953))

(declare-fun m!229955 () Bool)

(assert (=> b!202507 m!229955))

(declare-fun m!229957 () Bool)

(assert (=> b!202507 m!229957))

(declare-fun m!229959 () Bool)

(assert (=> b!202505 m!229959))

(declare-fun m!229961 () Bool)

(assert (=> b!202505 m!229961))

(declare-fun m!229963 () Bool)

(assert (=> b!202505 m!229963))

(declare-fun m!229965 () Bool)

(assert (=> b!202505 m!229965))

(declare-fun m!229967 () Bool)

(assert (=> b!202505 m!229967))

(declare-fun m!229969 () Bool)

(assert (=> b!202505 m!229969))

(declare-fun m!229971 () Bool)

(assert (=> b!202505 m!229971))

(declare-fun m!229973 () Bool)

(assert (=> b!202506 m!229973))

(declare-fun m!229975 () Bool)

(assert (=> b!202511 m!229975))

(declare-fun m!229977 () Bool)

(assert (=> b!202504 m!229977))

(declare-fun m!229979 () Bool)

(assert (=> b!202504 m!229979))

(declare-fun m!229981 () Bool)

(assert (=> b!202504 m!229981))

(declare-fun m!229983 () Bool)

(assert (=> mapNonEmpty!8504 m!229983))

(declare-fun m!229985 () Bool)

(assert (=> start!20446 m!229985))

(declare-fun m!229987 () Bool)

(assert (=> start!20446 m!229987))

(declare-fun m!229989 () Bool)

(assert (=> start!20446 m!229989))

(declare-fun m!229991 () Bool)

(assert (=> b!202510 m!229991))

(check-sat (not start!20446) (not b!202507) (not b!202506) (not b_next!5101) (not b!202510) (not mapNonEmpty!8504) (not b!202504) tp_is_empty!4957 (not b!202512) (not b!202505) b_and!11861)
(check-sat b_and!11861 (not b_next!5101))
