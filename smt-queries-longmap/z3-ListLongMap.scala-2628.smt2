; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39588 () Bool)

(assert start!39588)

(declare-fun b_free!9855 () Bool)

(declare-fun b_next!9855 () Bool)

(assert (=> start!39588 (= b_free!9855 (not b_next!9855))))

(declare-fun tp!35093 () Bool)

(declare-fun b_and!17511 () Bool)

(assert (=> start!39588 (= tp!35093 b_and!17511)))

(declare-fun b!423984 () Bool)

(declare-fun res!247920 () Bool)

(declare-fun e!251955 () Bool)

(assert (=> b!423984 (=> (not res!247920) (not e!251955))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!423984 (= res!247920 (bvsle from!863 i!563))))

(declare-fun b!423985 () Bool)

(declare-fun e!251956 () Bool)

(assert (=> b!423985 (= e!251956 e!251955)))

(declare-fun res!247923 () Bool)

(assert (=> b!423985 (=> (not res!247923) (not e!251955))))

(declare-datatypes ((array!25855 0))(
  ( (array!25856 (arr!12377 (Array (_ BitVec 32) (_ BitVec 64))) (size!12729 (_ BitVec 32))) )
))
(declare-fun lt!194279 () array!25855)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25855 (_ BitVec 32)) Bool)

(assert (=> b!423985 (= res!247923 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194279 mask!1025))))

(declare-fun _keys!709 () array!25855)

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!423985 (= lt!194279 (array!25856 (store (arr!12377 _keys!709) i!563 k0!794) (size!12729 _keys!709)))))

(declare-fun b!423986 () Bool)

(declare-fun e!251954 () Bool)

(declare-fun tp_is_empty!11007 () Bool)

(assert (=> b!423986 (= e!251954 tp_is_empty!11007)))

(declare-fun mapNonEmpty!18132 () Bool)

(declare-fun mapRes!18132 () Bool)

(declare-fun tp!35094 () Bool)

(assert (=> mapNonEmpty!18132 (= mapRes!18132 (and tp!35094 e!251954))))

(declare-fun mapKey!18132 () (_ BitVec 32))

(declare-datatypes ((V!15781 0))(
  ( (V!15782 (val!5548 Int)) )
))
(declare-datatypes ((ValueCell!5160 0))(
  ( (ValueCellFull!5160 (v!7795 V!15781)) (EmptyCell!5160) )
))
(declare-fun mapValue!18132 () ValueCell!5160)

(declare-fun mapRest!18132 () (Array (_ BitVec 32) ValueCell!5160))

(declare-datatypes ((array!25857 0))(
  ( (array!25858 (arr!12378 (Array (_ BitVec 32) ValueCell!5160)) (size!12730 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25857)

(assert (=> mapNonEmpty!18132 (= (arr!12378 _values!549) (store mapRest!18132 mapKey!18132 mapValue!18132))))

(declare-fun b!423987 () Bool)

(declare-fun res!247916 () Bool)

(assert (=> b!423987 (=> (not res!247916) (not e!251956))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!423987 (= res!247916 (validMask!0 mask!1025))))

(declare-fun b!423989 () Bool)

(declare-fun e!251953 () Bool)

(declare-fun e!251957 () Bool)

(assert (=> b!423989 (= e!251953 (and e!251957 mapRes!18132))))

(declare-fun condMapEmpty!18132 () Bool)

(declare-fun mapDefault!18132 () ValueCell!5160)

(assert (=> b!423989 (= condMapEmpty!18132 (= (arr!12378 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5160)) mapDefault!18132)))))

(declare-fun mapIsEmpty!18132 () Bool)

(assert (=> mapIsEmpty!18132 mapRes!18132))

(declare-fun b!423990 () Bool)

(declare-fun res!247918 () Bool)

(assert (=> b!423990 (=> (not res!247918) (not e!251956))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!423990 (= res!247918 (and (= (size!12730 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12729 _keys!709) (size!12730 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!423991 () Bool)

(declare-fun res!247912 () Bool)

(assert (=> b!423991 (=> (not res!247912) (not e!251955))))

(declare-datatypes ((List!7297 0))(
  ( (Nil!7294) (Cons!7293 (h!8149 (_ BitVec 64)) (t!12741 List!7297)) )
))
(declare-fun arrayNoDuplicates!0 (array!25855 (_ BitVec 32) List!7297) Bool)

(assert (=> b!423991 (= res!247912 (arrayNoDuplicates!0 lt!194279 #b00000000000000000000000000000000 Nil!7294))))

(declare-fun b!423992 () Bool)

(declare-fun res!247914 () Bool)

(assert (=> b!423992 (=> (not res!247914) (not e!251956))))

(declare-fun arrayContainsKey!0 (array!25855 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!423992 (= res!247914 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!423993 () Bool)

(declare-fun res!247917 () Bool)

(assert (=> b!423993 (=> (not res!247917) (not e!251956))))

(assert (=> b!423993 (= res!247917 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12729 _keys!709))))))

(declare-fun b!423994 () Bool)

(assert (=> b!423994 (= e!251957 tp_is_empty!11007)))

(declare-fun b!423995 () Bool)

(declare-fun res!247913 () Bool)

(assert (=> b!423995 (=> (not res!247913) (not e!251956))))

(assert (=> b!423995 (= res!247913 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!423996 () Bool)

(assert (=> b!423996 (= e!251955 false)))

(declare-fun minValue!515 () V!15781)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15781)

(declare-datatypes ((tuple2!7288 0))(
  ( (tuple2!7289 (_1!3655 (_ BitVec 64)) (_2!3655 V!15781)) )
))
(declare-datatypes ((List!7298 0))(
  ( (Nil!7295) (Cons!7294 (h!8150 tuple2!7288) (t!12742 List!7298)) )
))
(declare-datatypes ((ListLongMap!6201 0))(
  ( (ListLongMap!6202 (toList!3116 List!7298)) )
))
(declare-fun lt!194277 () ListLongMap!6201)

(declare-fun v!412 () V!15781)

(declare-fun getCurrentListMapNoExtraKeys!1320 (array!25855 array!25857 (_ BitVec 32) (_ BitVec 32) V!15781 V!15781 (_ BitVec 32) Int) ListLongMap!6201)

(assert (=> b!423996 (= lt!194277 (getCurrentListMapNoExtraKeys!1320 lt!194279 (array!25858 (store (arr!12378 _values!549) i!563 (ValueCellFull!5160 v!412)) (size!12730 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!194278 () ListLongMap!6201)

(assert (=> b!423996 (= lt!194278 (getCurrentListMapNoExtraKeys!1320 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun res!247921 () Bool)

(assert (=> start!39588 (=> (not res!247921) (not e!251956))))

(assert (=> start!39588 (= res!247921 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12729 _keys!709))))))

(assert (=> start!39588 e!251956))

(assert (=> start!39588 tp_is_empty!11007))

(assert (=> start!39588 tp!35093))

(assert (=> start!39588 true))

(declare-fun array_inv!9022 (array!25857) Bool)

(assert (=> start!39588 (and (array_inv!9022 _values!549) e!251953)))

(declare-fun array_inv!9023 (array!25855) Bool)

(assert (=> start!39588 (array_inv!9023 _keys!709)))

(declare-fun b!423988 () Bool)

(declare-fun res!247922 () Bool)

(assert (=> b!423988 (=> (not res!247922) (not e!251956))))

(assert (=> b!423988 (= res!247922 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7294))))

(declare-fun b!423997 () Bool)

(declare-fun res!247919 () Bool)

(assert (=> b!423997 (=> (not res!247919) (not e!251956))))

(assert (=> b!423997 (= res!247919 (or (= (select (arr!12377 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12377 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!423998 () Bool)

(declare-fun res!247915 () Bool)

(assert (=> b!423998 (=> (not res!247915) (not e!251956))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!423998 (= res!247915 (validKeyInArray!0 k0!794))))

(assert (= (and start!39588 res!247921) b!423987))

(assert (= (and b!423987 res!247916) b!423990))

(assert (= (and b!423990 res!247918) b!423995))

(assert (= (and b!423995 res!247913) b!423988))

(assert (= (and b!423988 res!247922) b!423993))

(assert (= (and b!423993 res!247917) b!423998))

(assert (= (and b!423998 res!247915) b!423997))

(assert (= (and b!423997 res!247919) b!423992))

(assert (= (and b!423992 res!247914) b!423985))

(assert (= (and b!423985 res!247923) b!423991))

(assert (= (and b!423991 res!247912) b!423984))

(assert (= (and b!423984 res!247920) b!423996))

(assert (= (and b!423989 condMapEmpty!18132) mapIsEmpty!18132))

(assert (= (and b!423989 (not condMapEmpty!18132)) mapNonEmpty!18132))

(get-info :version)

(assert (= (and mapNonEmpty!18132 ((_ is ValueCellFull!5160) mapValue!18132)) b!423986))

(assert (= (and b!423989 ((_ is ValueCellFull!5160) mapDefault!18132)) b!423994))

(assert (= start!39588 b!423989))

(declare-fun m!413283 () Bool)

(assert (=> b!423997 m!413283))

(declare-fun m!413285 () Bool)

(assert (=> b!423996 m!413285))

(declare-fun m!413287 () Bool)

(assert (=> b!423996 m!413287))

(declare-fun m!413289 () Bool)

(assert (=> b!423996 m!413289))

(declare-fun m!413291 () Bool)

(assert (=> b!423988 m!413291))

(declare-fun m!413293 () Bool)

(assert (=> b!423991 m!413293))

(declare-fun m!413295 () Bool)

(assert (=> b!423998 m!413295))

(declare-fun m!413297 () Bool)

(assert (=> b!423992 m!413297))

(declare-fun m!413299 () Bool)

(assert (=> b!423987 m!413299))

(declare-fun m!413301 () Bool)

(assert (=> b!423985 m!413301))

(declare-fun m!413303 () Bool)

(assert (=> b!423985 m!413303))

(declare-fun m!413305 () Bool)

(assert (=> b!423995 m!413305))

(declare-fun m!413307 () Bool)

(assert (=> start!39588 m!413307))

(declare-fun m!413309 () Bool)

(assert (=> start!39588 m!413309))

(declare-fun m!413311 () Bool)

(assert (=> mapNonEmpty!18132 m!413311))

(check-sat (not b_next!9855) (not b!423996) tp_is_empty!11007 b_and!17511 (not b!423998) (not mapNonEmpty!18132) (not b!423995) (not b!423985) (not b!423988) (not start!39588) (not b!423991) (not b!423987) (not b!423992))
(check-sat b_and!17511 (not b_next!9855))
