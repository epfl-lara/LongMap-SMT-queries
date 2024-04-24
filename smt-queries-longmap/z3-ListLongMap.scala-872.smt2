; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20332 () Bool)

(assert start!20332)

(declare-fun b_free!4987 () Bool)

(declare-fun b_next!4987 () Bool)

(assert (=> start!20332 (= b_free!4987 (not b_next!4987))))

(declare-fun tp!17993 () Bool)

(declare-fun b_and!11747 () Bool)

(assert (=> start!20332 (= tp!17993 b_and!11747)))

(declare-fun b!200441 () Bool)

(declare-fun res!95496 () Bool)

(declare-fun e!131440 () Bool)

(assert (=> b!200441 (=> (not res!95496) (not e!131440))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!8911 0))(
  ( (array!8912 (arr!4206 (Array (_ BitVec 32) (_ BitVec 64))) (size!4531 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8911)

(assert (=> b!200441 (= res!95496 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4531 _keys!825))))))

(declare-fun b!200442 () Bool)

(declare-fun e!131438 () Bool)

(assert (=> b!200442 (= e!131440 (not e!131438))))

(declare-fun res!95495 () Bool)

(assert (=> b!200442 (=> res!95495 e!131438)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!200442 (= res!95495 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!6105 0))(
  ( (V!6106 (val!2466 Int)) )
))
(declare-datatypes ((ValueCell!2078 0))(
  ( (ValueCellFull!2078 (v!4437 V!6105)) (EmptyCell!2078) )
))
(declare-datatypes ((array!8913 0))(
  ( (array!8914 (arr!4207 (Array (_ BitVec 32) ValueCell!2078)) (size!4532 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8913)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-datatypes ((tuple2!3662 0))(
  ( (tuple2!3663 (_1!1842 (_ BitVec 64)) (_2!1842 V!6105)) )
))
(declare-datatypes ((List!2583 0))(
  ( (Nil!2580) (Cons!2579 (h!3221 tuple2!3662) (t!7506 List!2583)) )
))
(declare-datatypes ((ListLongMap!2577 0))(
  ( (ListLongMap!2578 (toList!1304 List!2583)) )
))
(declare-fun lt!99035 () ListLongMap!2577)

(declare-fun zeroValue!615 () V!6105)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6105)

(declare-fun getCurrentListMap!899 (array!8911 array!8913 (_ BitVec 32) (_ BitVec 32) V!6105 V!6105 (_ BitVec 32) Int) ListLongMap!2577)

(assert (=> b!200442 (= lt!99035 (getCurrentListMap!899 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!99045 () array!8913)

(declare-fun lt!99040 () ListLongMap!2577)

(assert (=> b!200442 (= lt!99040 (getCurrentListMap!899 _keys!825 lt!99045 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!99047 () ListLongMap!2577)

(declare-fun lt!99036 () ListLongMap!2577)

(assert (=> b!200442 (and (= lt!99047 lt!99036) (= lt!99036 lt!99047))))

(declare-fun lt!99049 () ListLongMap!2577)

(declare-fun lt!99044 () tuple2!3662)

(declare-fun +!358 (ListLongMap!2577 tuple2!3662) ListLongMap!2577)

(assert (=> b!200442 (= lt!99036 (+!358 lt!99049 lt!99044))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun v!520 () V!6105)

(assert (=> b!200442 (= lt!99044 (tuple2!3663 k0!843 v!520))))

(declare-datatypes ((Unit!6000 0))(
  ( (Unit!6001) )
))
(declare-fun lt!99041 () Unit!6000)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!35 (array!8911 array!8913 (_ BitVec 32) (_ BitVec 32) V!6105 V!6105 (_ BitVec 32) (_ BitVec 64) V!6105 (_ BitVec 32) Int) Unit!6000)

(assert (=> b!200442 (= lt!99041 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!35 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!292 (array!8911 array!8913 (_ BitVec 32) (_ BitVec 32) V!6105 V!6105 (_ BitVec 32) Int) ListLongMap!2577)

(assert (=> b!200442 (= lt!99047 (getCurrentListMapNoExtraKeys!292 _keys!825 lt!99045 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!200442 (= lt!99045 (array!8914 (store (arr!4207 _values!649) i!601 (ValueCellFull!2078 v!520)) (size!4532 _values!649)))))

(assert (=> b!200442 (= lt!99049 (getCurrentListMapNoExtraKeys!292 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!200443 () Bool)

(declare-fun e!131441 () Bool)

(declare-fun tp_is_empty!4843 () Bool)

(assert (=> b!200443 (= e!131441 tp_is_empty!4843)))

(declare-fun b!200444 () Bool)

(declare-fun res!95493 () Bool)

(assert (=> b!200444 (=> (not res!95493) (not e!131440))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!200444 (= res!95493 (validKeyInArray!0 k0!843))))

(declare-fun b!200445 () Bool)

(declare-fun e!131436 () Bool)

(declare-fun mapRes!8333 () Bool)

(assert (=> b!200445 (= e!131436 (and e!131441 mapRes!8333))))

(declare-fun condMapEmpty!8333 () Bool)

(declare-fun mapDefault!8333 () ValueCell!2078)

(assert (=> b!200445 (= condMapEmpty!8333 (= (arr!4207 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2078)) mapDefault!8333)))))

(declare-fun mapIsEmpty!8333 () Bool)

(assert (=> mapIsEmpty!8333 mapRes!8333))

(declare-fun b!200446 () Bool)

(declare-fun res!95491 () Bool)

(assert (=> b!200446 (=> (not res!95491) (not e!131440))))

(assert (=> b!200446 (= res!95491 (and (= (size!4532 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4531 _keys!825) (size!4532 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun res!95490 () Bool)

(assert (=> start!20332 (=> (not res!95490) (not e!131440))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20332 (= res!95490 (validMask!0 mask!1149))))

(assert (=> start!20332 e!131440))

(declare-fun array_inv!2745 (array!8913) Bool)

(assert (=> start!20332 (and (array_inv!2745 _values!649) e!131436)))

(assert (=> start!20332 true))

(assert (=> start!20332 tp_is_empty!4843))

(declare-fun array_inv!2746 (array!8911) Bool)

(assert (=> start!20332 (array_inv!2746 _keys!825)))

(assert (=> start!20332 tp!17993))

(declare-fun b!200447 () Bool)

(declare-fun res!95494 () Bool)

(assert (=> b!200447 (=> (not res!95494) (not e!131440))))

(declare-datatypes ((List!2584 0))(
  ( (Nil!2581) (Cons!2580 (h!3222 (_ BitVec 64)) (t!7507 List!2584)) )
))
(declare-fun arrayNoDuplicates!0 (array!8911 (_ BitVec 32) List!2584) Bool)

(assert (=> b!200447 (= res!95494 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2581))))

(declare-fun b!200448 () Bool)

(declare-fun res!95492 () Bool)

(assert (=> b!200448 (=> (not res!95492) (not e!131440))))

(assert (=> b!200448 (= res!95492 (= (select (arr!4206 _keys!825) i!601) k0!843))))

(declare-fun b!200449 () Bool)

(declare-fun e!131435 () Bool)

(assert (=> b!200449 (= e!131438 e!131435)))

(declare-fun res!95497 () Bool)

(assert (=> b!200449 (=> res!95497 e!131435)))

(assert (=> b!200449 (= res!95497 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!99037 () ListLongMap!2577)

(declare-fun lt!99039 () ListLongMap!2577)

(assert (=> b!200449 (= lt!99037 lt!99039)))

(declare-fun lt!99048 () ListLongMap!2577)

(assert (=> b!200449 (= lt!99039 (+!358 lt!99048 lt!99044))))

(declare-fun lt!99038 () Unit!6000)

(declare-fun addCommutativeForDiffKeys!86 (ListLongMap!2577 (_ BitVec 64) V!6105 (_ BitVec 64) V!6105) Unit!6000)

(assert (=> b!200449 (= lt!99038 (addCommutativeForDiffKeys!86 lt!99049 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun lt!99042 () tuple2!3662)

(assert (=> b!200449 (= lt!99040 (+!358 lt!99037 lt!99042))))

(declare-fun lt!99050 () tuple2!3662)

(assert (=> b!200449 (= lt!99037 (+!358 lt!99036 lt!99050))))

(declare-fun lt!99046 () ListLongMap!2577)

(assert (=> b!200449 (= lt!99035 lt!99046)))

(assert (=> b!200449 (= lt!99046 (+!358 lt!99048 lt!99042))))

(assert (=> b!200449 (= lt!99048 (+!358 lt!99049 lt!99050))))

(assert (=> b!200449 (= lt!99040 (+!358 (+!358 lt!99047 lt!99050) lt!99042))))

(assert (=> b!200449 (= lt!99042 (tuple2!3663 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!200449 (= lt!99050 (tuple2!3663 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!200450 () Bool)

(declare-fun e!131437 () Bool)

(assert (=> b!200450 (= e!131437 tp_is_empty!4843)))

(declare-fun b!200451 () Bool)

(declare-fun res!95489 () Bool)

(assert (=> b!200451 (=> (not res!95489) (not e!131440))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8911 (_ BitVec 32)) Bool)

(assert (=> b!200451 (= res!95489 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapNonEmpty!8333 () Bool)

(declare-fun tp!17992 () Bool)

(assert (=> mapNonEmpty!8333 (= mapRes!8333 (and tp!17992 e!131437))))

(declare-fun mapRest!8333 () (Array (_ BitVec 32) ValueCell!2078))

(declare-fun mapKey!8333 () (_ BitVec 32))

(declare-fun mapValue!8333 () ValueCell!2078)

(assert (=> mapNonEmpty!8333 (= (arr!4207 _values!649) (store mapRest!8333 mapKey!8333 mapValue!8333))))

(declare-fun b!200452 () Bool)

(assert (=> b!200452 (= e!131435 true)))

(assert (=> b!200452 (= (+!358 lt!99039 lt!99042) (+!358 lt!99046 lt!99044))))

(declare-fun lt!99043 () Unit!6000)

(assert (=> b!200452 (= lt!99043 (addCommutativeForDiffKeys!86 lt!99048 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (= (and start!20332 res!95490) b!200446))

(assert (= (and b!200446 res!95491) b!200451))

(assert (= (and b!200451 res!95489) b!200447))

(assert (= (and b!200447 res!95494) b!200441))

(assert (= (and b!200441 res!95496) b!200444))

(assert (= (and b!200444 res!95493) b!200448))

(assert (= (and b!200448 res!95492) b!200442))

(assert (= (and b!200442 (not res!95495)) b!200449))

(assert (= (and b!200449 (not res!95497)) b!200452))

(assert (= (and b!200445 condMapEmpty!8333) mapIsEmpty!8333))

(assert (= (and b!200445 (not condMapEmpty!8333)) mapNonEmpty!8333))

(get-info :version)

(assert (= (and mapNonEmpty!8333 ((_ is ValueCellFull!2078) mapValue!8333)) b!200450))

(assert (= (and b!200445 ((_ is ValueCellFull!2078) mapDefault!8333)) b!200443))

(assert (= start!20332 b!200445))

(declare-fun m!227037 () Bool)

(assert (=> mapNonEmpty!8333 m!227037))

(declare-fun m!227039 () Bool)

(assert (=> b!200444 m!227039))

(declare-fun m!227041 () Bool)

(assert (=> b!200451 m!227041))

(declare-fun m!227043 () Bool)

(assert (=> b!200452 m!227043))

(declare-fun m!227045 () Bool)

(assert (=> b!200452 m!227045))

(declare-fun m!227047 () Bool)

(assert (=> b!200452 m!227047))

(declare-fun m!227049 () Bool)

(assert (=> b!200442 m!227049))

(declare-fun m!227051 () Bool)

(assert (=> b!200442 m!227051))

(declare-fun m!227053 () Bool)

(assert (=> b!200442 m!227053))

(declare-fun m!227055 () Bool)

(assert (=> b!200442 m!227055))

(declare-fun m!227057 () Bool)

(assert (=> b!200442 m!227057))

(declare-fun m!227059 () Bool)

(assert (=> b!200442 m!227059))

(declare-fun m!227061 () Bool)

(assert (=> b!200442 m!227061))

(declare-fun m!227063 () Bool)

(assert (=> start!20332 m!227063))

(declare-fun m!227065 () Bool)

(assert (=> start!20332 m!227065))

(declare-fun m!227067 () Bool)

(assert (=> start!20332 m!227067))

(declare-fun m!227069 () Bool)

(assert (=> b!200448 m!227069))

(declare-fun m!227071 () Bool)

(assert (=> b!200447 m!227071))

(declare-fun m!227073 () Bool)

(assert (=> b!200449 m!227073))

(declare-fun m!227075 () Bool)

(assert (=> b!200449 m!227075))

(declare-fun m!227077 () Bool)

(assert (=> b!200449 m!227077))

(declare-fun m!227079 () Bool)

(assert (=> b!200449 m!227079))

(declare-fun m!227081 () Bool)

(assert (=> b!200449 m!227081))

(declare-fun m!227083 () Bool)

(assert (=> b!200449 m!227083))

(declare-fun m!227085 () Bool)

(assert (=> b!200449 m!227085))

(assert (=> b!200449 m!227077))

(declare-fun m!227087 () Bool)

(assert (=> b!200449 m!227087))

(check-sat (not b!200449) (not b!200447) (not mapNonEmpty!8333) (not b!200452) (not b_next!4987) b_and!11747 (not b!200442) (not start!20332) (not b!200444) (not b!200451) tp_is_empty!4843)
(check-sat b_and!11747 (not b_next!4987))
