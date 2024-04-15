; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20254 () Bool)

(assert start!20254)

(declare-fun b_free!4909 () Bool)

(declare-fun b_next!4909 () Bool)

(assert (=> start!20254 (= b_free!4909 (not b_next!4909))))

(declare-fun tp!17758 () Bool)

(declare-fun b_and!11629 () Bool)

(assert (=> start!20254 (= tp!17758 b_and!11629)))

(declare-fun b!199037 () Bool)

(declare-fun res!94519 () Bool)

(declare-fun e!130698 () Bool)

(assert (=> b!199037 (=> (not res!94519) (not e!130698))))

(declare-datatypes ((array!8751 0))(
  ( (array!8752 (arr!4125 (Array (_ BitVec 32) (_ BitVec 64))) (size!4451 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8751)

(declare-datatypes ((List!2568 0))(
  ( (Nil!2565) (Cons!2564 (h!3206 (_ BitVec 64)) (t!7490 List!2568)) )
))
(declare-fun arrayNoDuplicates!0 (array!8751 (_ BitVec 32) List!2568) Bool)

(assert (=> b!199037 (= res!94519 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2565))))

(declare-fun b!199038 () Bool)

(declare-fun e!130695 () Bool)

(declare-fun tp_is_empty!4765 () Bool)

(assert (=> b!199038 (= e!130695 tp_is_empty!4765)))

(declare-fun mapNonEmpty!8216 () Bool)

(declare-fun mapRes!8216 () Bool)

(declare-fun tp!17759 () Bool)

(assert (=> mapNonEmpty!8216 (= mapRes!8216 (and tp!17759 e!130695))))

(declare-fun mapKey!8216 () (_ BitVec 32))

(declare-datatypes ((V!6001 0))(
  ( (V!6002 (val!2427 Int)) )
))
(declare-datatypes ((ValueCell!2039 0))(
  ( (ValueCellFull!2039 (v!4391 V!6001)) (EmptyCell!2039) )
))
(declare-datatypes ((array!8753 0))(
  ( (array!8754 (arr!4126 (Array (_ BitVec 32) ValueCell!2039)) (size!4452 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8753)

(declare-fun mapValue!8216 () ValueCell!2039)

(declare-fun mapRest!8216 () (Array (_ BitVec 32) ValueCell!2039))

(assert (=> mapNonEmpty!8216 (= (arr!4126 _values!649) (store mapRest!8216 mapKey!8216 mapValue!8216))))

(declare-fun mapIsEmpty!8216 () Bool)

(assert (=> mapIsEmpty!8216 mapRes!8216))

(declare-fun b!199039 () Bool)

(declare-fun res!94518 () Bool)

(assert (=> b!199039 (=> (not res!94518) (not e!130698))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!199039 (= res!94518 (and (= (size!4452 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4451 _keys!825) (size!4452 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!199040 () Bool)

(declare-fun res!94514 () Bool)

(assert (=> b!199040 (=> (not res!94514) (not e!130698))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!199040 (= res!94514 (validKeyInArray!0 k0!843))))

(declare-fun b!199041 () Bool)

(declare-fun res!94515 () Bool)

(assert (=> b!199041 (=> (not res!94515) (not e!130698))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!199041 (= res!94515 (= (select (arr!4125 _keys!825) i!601) k0!843))))

(declare-fun res!94517 () Bool)

(assert (=> start!20254 (=> (not res!94517) (not e!130698))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20254 (= res!94517 (validMask!0 mask!1149))))

(assert (=> start!20254 e!130698))

(declare-fun e!130697 () Bool)

(declare-fun array_inv!2689 (array!8753) Bool)

(assert (=> start!20254 (and (array_inv!2689 _values!649) e!130697)))

(assert (=> start!20254 true))

(assert (=> start!20254 tp_is_empty!4765))

(declare-fun array_inv!2690 (array!8751) Bool)

(assert (=> start!20254 (array_inv!2690 _keys!825)))

(assert (=> start!20254 tp!17758))

(declare-fun b!199042 () Bool)

(declare-fun res!94516 () Bool)

(assert (=> b!199042 (=> (not res!94516) (not e!130698))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8751 (_ BitVec 32)) Bool)

(assert (=> b!199042 (= res!94516 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!199043 () Bool)

(declare-fun e!130696 () Bool)

(assert (=> b!199043 (= e!130697 (and e!130696 mapRes!8216))))

(declare-fun condMapEmpty!8216 () Bool)

(declare-fun mapDefault!8216 () ValueCell!2039)

(assert (=> b!199043 (= condMapEmpty!8216 (= (arr!4126 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2039)) mapDefault!8216)))))

(declare-fun b!199044 () Bool)

(declare-fun res!94520 () Bool)

(assert (=> b!199044 (=> (not res!94520) (not e!130698))))

(assert (=> b!199044 (= res!94520 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4451 _keys!825))))))

(declare-fun b!199045 () Bool)

(assert (=> b!199045 (= e!130698 (not true))))

(declare-datatypes ((tuple2!3638 0))(
  ( (tuple2!3639 (_1!1830 (_ BitVec 64)) (_2!1830 V!6001)) )
))
(declare-datatypes ((List!2569 0))(
  ( (Nil!2566) (Cons!2565 (h!3207 tuple2!3638) (t!7491 List!2569)) )
))
(declare-datatypes ((ListLongMap!2541 0))(
  ( (ListLongMap!2542 (toList!1286 List!2569)) )
))
(declare-fun lt!98017 () ListLongMap!2541)

(declare-fun lt!98016 () ListLongMap!2541)

(assert (=> b!199045 (and (= lt!98017 lt!98016) (= lt!98016 lt!98017))))

(declare-fun lt!98018 () ListLongMap!2541)

(declare-fun v!520 () V!6001)

(declare-fun +!335 (ListLongMap!2541 tuple2!3638) ListLongMap!2541)

(assert (=> b!199045 (= lt!98016 (+!335 lt!98018 (tuple2!3639 k0!843 v!520)))))

(declare-datatypes ((Unit!5922 0))(
  ( (Unit!5923) )
))
(declare-fun lt!98015 () Unit!5922)

(declare-fun zeroValue!615 () V!6001)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6001)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!15 (array!8751 array!8753 (_ BitVec 32) (_ BitVec 32) V!6001 V!6001 (_ BitVec 32) (_ BitVec 64) V!6001 (_ BitVec 32) Int) Unit!5922)

(assert (=> b!199045 (= lt!98015 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!15 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!266 (array!8751 array!8753 (_ BitVec 32) (_ BitVec 32) V!6001 V!6001 (_ BitVec 32) Int) ListLongMap!2541)

(assert (=> b!199045 (= lt!98017 (getCurrentListMapNoExtraKeys!266 _keys!825 (array!8754 (store (arr!4126 _values!649) i!601 (ValueCellFull!2039 v!520)) (size!4452 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!199045 (= lt!98018 (getCurrentListMapNoExtraKeys!266 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!199046 () Bool)

(assert (=> b!199046 (= e!130696 tp_is_empty!4765)))

(assert (= (and start!20254 res!94517) b!199039))

(assert (= (and b!199039 res!94518) b!199042))

(assert (= (and b!199042 res!94516) b!199037))

(assert (= (and b!199037 res!94519) b!199044))

(assert (= (and b!199044 res!94520) b!199040))

(assert (= (and b!199040 res!94514) b!199041))

(assert (= (and b!199041 res!94515) b!199045))

(assert (= (and b!199043 condMapEmpty!8216) mapIsEmpty!8216))

(assert (= (and b!199043 (not condMapEmpty!8216)) mapNonEmpty!8216))

(get-info :version)

(assert (= (and mapNonEmpty!8216 ((_ is ValueCellFull!2039) mapValue!8216)) b!199038))

(assert (= (and b!199043 ((_ is ValueCellFull!2039) mapDefault!8216)) b!199046))

(assert (= start!20254 b!199043))

(declare-fun m!225063 () Bool)

(assert (=> start!20254 m!225063))

(declare-fun m!225065 () Bool)

(assert (=> start!20254 m!225065))

(declare-fun m!225067 () Bool)

(assert (=> start!20254 m!225067))

(declare-fun m!225069 () Bool)

(assert (=> b!199037 m!225069))

(declare-fun m!225071 () Bool)

(assert (=> b!199040 m!225071))

(declare-fun m!225073 () Bool)

(assert (=> b!199041 m!225073))

(declare-fun m!225075 () Bool)

(assert (=> b!199045 m!225075))

(declare-fun m!225077 () Bool)

(assert (=> b!199045 m!225077))

(declare-fun m!225079 () Bool)

(assert (=> b!199045 m!225079))

(declare-fun m!225081 () Bool)

(assert (=> b!199045 m!225081))

(declare-fun m!225083 () Bool)

(assert (=> b!199045 m!225083))

(declare-fun m!225085 () Bool)

(assert (=> mapNonEmpty!8216 m!225085))

(declare-fun m!225087 () Bool)

(assert (=> b!199042 m!225087))

(check-sat (not b!199037) (not b_next!4909) b_and!11629 (not mapNonEmpty!8216) (not start!20254) (not b!199042) (not b!199040) tp_is_empty!4765 (not b!199045))
(check-sat b_and!11629 (not b_next!4909))
