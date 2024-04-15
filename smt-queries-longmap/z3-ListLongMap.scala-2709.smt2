; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40058 () Bool)

(assert start!40058)

(declare-fun b_free!10339 () Bool)

(declare-fun b_next!10339 () Bool)

(assert (=> start!40058 (= b_free!10339 (not b_next!10339))))

(declare-fun tp!36546 () Bool)

(declare-fun b_and!18281 () Bool)

(assert (=> start!40058 (= tp!36546 b_and!18281)))

(declare-fun b!437221 () Bool)

(declare-fun e!258029 () Bool)

(declare-fun e!258033 () Bool)

(assert (=> b!437221 (= e!258029 e!258033)))

(declare-fun res!257984 () Bool)

(assert (=> b!437221 (=> (not res!257984) (not e!258033))))

(declare-datatypes ((array!26803 0))(
  ( (array!26804 (arr!12851 (Array (_ BitVec 32) (_ BitVec 64))) (size!13204 (_ BitVec 32))) )
))
(declare-fun lt!201428 () array!26803)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26803 (_ BitVec 32)) Bool)

(assert (=> b!437221 (= res!257984 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!201428 mask!1025))))

(declare-fun _keys!709 () array!26803)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!437221 (= lt!201428 (array!26804 (store (arr!12851 _keys!709) i!563 k0!794) (size!13204 _keys!709)))))

(declare-fun b!437222 () Bool)

(declare-fun res!257974 () Bool)

(assert (=> b!437222 (=> (not res!257974) (not e!258033))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!437222 (= res!257974 (bvsle from!863 i!563))))

(declare-fun b!437223 () Bool)

(declare-fun e!258027 () Bool)

(declare-fun tp_is_empty!11491 () Bool)

(assert (=> b!437223 (= e!258027 tp_is_empty!11491)))

(declare-fun b!437224 () Bool)

(declare-fun res!257973 () Bool)

(assert (=> b!437224 (=> (not res!257973) (not e!258029))))

(declare-datatypes ((List!7678 0))(
  ( (Nil!7675) (Cons!7674 (h!8530 (_ BitVec 64)) (t!13425 List!7678)) )
))
(declare-fun arrayNoDuplicates!0 (array!26803 (_ BitVec 32) List!7678) Bool)

(assert (=> b!437224 (= res!257973 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7675))))

(declare-fun b!437225 () Bool)

(declare-fun res!257976 () Bool)

(assert (=> b!437225 (=> (not res!257976) (not e!258029))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!437225 (= res!257976 (validMask!0 mask!1025))))

(declare-fun b!437226 () Bool)

(declare-fun res!257983 () Bool)

(assert (=> b!437226 (=> (not res!257983) (not e!258029))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16427 0))(
  ( (V!16428 (val!5790 Int)) )
))
(declare-datatypes ((ValueCell!5402 0))(
  ( (ValueCellFull!5402 (v!8031 V!16427)) (EmptyCell!5402) )
))
(declare-datatypes ((array!26805 0))(
  ( (array!26806 (arr!12852 (Array (_ BitVec 32) ValueCell!5402)) (size!13205 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26805)

(assert (=> b!437226 (= res!257983 (and (= (size!13205 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13204 _keys!709) (size!13205 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!437227 () Bool)

(declare-fun e!258030 () Bool)

(declare-fun mapRes!18858 () Bool)

(assert (=> b!437227 (= e!258030 (and e!258027 mapRes!18858))))

(declare-fun condMapEmpty!18858 () Bool)

(declare-fun mapDefault!18858 () ValueCell!5402)

(assert (=> b!437227 (= condMapEmpty!18858 (= (arr!12852 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5402)) mapDefault!18858)))))

(declare-fun b!437228 () Bool)

(declare-fun res!257985 () Bool)

(assert (=> b!437228 (=> (not res!257985) (not e!258029))))

(assert (=> b!437228 (= res!257985 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13204 _keys!709))))))

(declare-fun b!437229 () Bool)

(declare-fun res!257975 () Bool)

(assert (=> b!437229 (=> (not res!257975) (not e!258029))))

(declare-fun arrayContainsKey!0 (array!26803 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!437229 (= res!257975 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!437230 () Bool)

(declare-fun e!258032 () Bool)

(assert (=> b!437230 (= e!258032 tp_is_empty!11491)))

(declare-fun b!437231 () Bool)

(declare-fun e!258031 () Bool)

(assert (=> b!437231 (= e!258033 e!258031)))

(declare-fun res!257982 () Bool)

(assert (=> b!437231 (=> (not res!257982) (not e!258031))))

(assert (=> b!437231 (= res!257982 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!16427)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!16427)

(declare-datatypes ((tuple2!7692 0))(
  ( (tuple2!7693 (_1!3857 (_ BitVec 64)) (_2!3857 V!16427)) )
))
(declare-datatypes ((List!7679 0))(
  ( (Nil!7676) (Cons!7675 (h!8531 tuple2!7692) (t!13426 List!7679)) )
))
(declare-datatypes ((ListLongMap!6595 0))(
  ( (ListLongMap!6596 (toList!3313 List!7679)) )
))
(declare-fun lt!201429 () ListLongMap!6595)

(declare-fun lt!201427 () array!26805)

(declare-fun getCurrentListMapNoExtraKeys!1512 (array!26803 array!26805 (_ BitVec 32) (_ BitVec 32) V!16427 V!16427 (_ BitVec 32) Int) ListLongMap!6595)

(assert (=> b!437231 (= lt!201429 (getCurrentListMapNoExtraKeys!1512 lt!201428 lt!201427 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16427)

(assert (=> b!437231 (= lt!201427 (array!26806 (store (arr!12852 _values!549) i!563 (ValueCellFull!5402 v!412)) (size!13205 _values!549)))))

(declare-fun lt!201431 () ListLongMap!6595)

(assert (=> b!437231 (= lt!201431 (getCurrentListMapNoExtraKeys!1512 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun res!257981 () Bool)

(assert (=> start!40058 (=> (not res!257981) (not e!258029))))

(assert (=> start!40058 (= res!257981 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13204 _keys!709))))))

(assert (=> start!40058 e!258029))

(assert (=> start!40058 tp_is_empty!11491))

(assert (=> start!40058 tp!36546))

(assert (=> start!40058 true))

(declare-fun array_inv!9386 (array!26805) Bool)

(assert (=> start!40058 (and (array_inv!9386 _values!549) e!258030)))

(declare-fun array_inv!9387 (array!26803) Bool)

(assert (=> start!40058 (array_inv!9387 _keys!709)))

(declare-fun b!437232 () Bool)

(declare-fun res!257977 () Bool)

(assert (=> b!437232 (=> (not res!257977) (not e!258029))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!437232 (= res!257977 (validKeyInArray!0 k0!794))))

(declare-fun b!437233 () Bool)

(declare-fun res!257980 () Bool)

(assert (=> b!437233 (=> (not res!257980) (not e!258033))))

(assert (=> b!437233 (= res!257980 (arrayNoDuplicates!0 lt!201428 #b00000000000000000000000000000000 Nil!7675))))

(declare-fun mapIsEmpty!18858 () Bool)

(assert (=> mapIsEmpty!18858 mapRes!18858))

(declare-fun b!437234 () Bool)

(declare-fun res!257979 () Bool)

(assert (=> b!437234 (=> (not res!257979) (not e!258029))))

(assert (=> b!437234 (= res!257979 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!437235 () Bool)

(declare-fun res!257978 () Bool)

(assert (=> b!437235 (=> (not res!257978) (not e!258029))))

(assert (=> b!437235 (= res!257978 (or (= (select (arr!12851 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12851 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!437236 () Bool)

(assert (=> b!437236 (= e!258031 (not true))))

(declare-fun +!1486 (ListLongMap!6595 tuple2!7692) ListLongMap!6595)

(assert (=> b!437236 (= (getCurrentListMapNoExtraKeys!1512 lt!201428 lt!201427 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1486 (getCurrentListMapNoExtraKeys!1512 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7693 k0!794 v!412)))))

(declare-datatypes ((Unit!12989 0))(
  ( (Unit!12990) )
))
(declare-fun lt!201430 () Unit!12989)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!624 (array!26803 array!26805 (_ BitVec 32) (_ BitVec 32) V!16427 V!16427 (_ BitVec 32) (_ BitVec 64) V!16427 (_ BitVec 32) Int) Unit!12989)

(assert (=> b!437236 (= lt!201430 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!624 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!18858 () Bool)

(declare-fun tp!36545 () Bool)

(assert (=> mapNonEmpty!18858 (= mapRes!18858 (and tp!36545 e!258032))))

(declare-fun mapValue!18858 () ValueCell!5402)

(declare-fun mapRest!18858 () (Array (_ BitVec 32) ValueCell!5402))

(declare-fun mapKey!18858 () (_ BitVec 32))

(assert (=> mapNonEmpty!18858 (= (arr!12852 _values!549) (store mapRest!18858 mapKey!18858 mapValue!18858))))

(assert (= (and start!40058 res!257981) b!437225))

(assert (= (and b!437225 res!257976) b!437226))

(assert (= (and b!437226 res!257983) b!437234))

(assert (= (and b!437234 res!257979) b!437224))

(assert (= (and b!437224 res!257973) b!437228))

(assert (= (and b!437228 res!257985) b!437232))

(assert (= (and b!437232 res!257977) b!437235))

(assert (= (and b!437235 res!257978) b!437229))

(assert (= (and b!437229 res!257975) b!437221))

(assert (= (and b!437221 res!257984) b!437233))

(assert (= (and b!437233 res!257980) b!437222))

(assert (= (and b!437222 res!257974) b!437231))

(assert (= (and b!437231 res!257982) b!437236))

(assert (= (and b!437227 condMapEmpty!18858) mapIsEmpty!18858))

(assert (= (and b!437227 (not condMapEmpty!18858)) mapNonEmpty!18858))

(get-info :version)

(assert (= (and mapNonEmpty!18858 ((_ is ValueCellFull!5402) mapValue!18858)) b!437230))

(assert (= (and b!437227 ((_ is ValueCellFull!5402) mapDefault!18858)) b!437223))

(assert (= start!40058 b!437227))

(declare-fun m!424419 () Bool)

(assert (=> b!437224 m!424419))

(declare-fun m!424421 () Bool)

(assert (=> b!437236 m!424421))

(declare-fun m!424423 () Bool)

(assert (=> b!437236 m!424423))

(assert (=> b!437236 m!424423))

(declare-fun m!424425 () Bool)

(assert (=> b!437236 m!424425))

(declare-fun m!424427 () Bool)

(assert (=> b!437236 m!424427))

(declare-fun m!424429 () Bool)

(assert (=> b!437231 m!424429))

(declare-fun m!424431 () Bool)

(assert (=> b!437231 m!424431))

(declare-fun m!424433 () Bool)

(assert (=> b!437231 m!424433))

(declare-fun m!424435 () Bool)

(assert (=> b!437229 m!424435))

(declare-fun m!424437 () Bool)

(assert (=> b!437233 m!424437))

(declare-fun m!424439 () Bool)

(assert (=> start!40058 m!424439))

(declare-fun m!424441 () Bool)

(assert (=> start!40058 m!424441))

(declare-fun m!424443 () Bool)

(assert (=> b!437235 m!424443))

(declare-fun m!424445 () Bool)

(assert (=> b!437234 m!424445))

(declare-fun m!424447 () Bool)

(assert (=> mapNonEmpty!18858 m!424447))

(declare-fun m!424449 () Bool)

(assert (=> b!437221 m!424449))

(declare-fun m!424451 () Bool)

(assert (=> b!437221 m!424451))

(declare-fun m!424453 () Bool)

(assert (=> b!437232 m!424453))

(declare-fun m!424455 () Bool)

(assert (=> b!437225 m!424455))

(check-sat (not b!437229) (not b!437224) (not start!40058) (not mapNonEmpty!18858) (not b!437232) tp_is_empty!11491 (not b!437231) b_and!18281 (not b!437234) (not b!437233) (not b!437236) (not b!437221) (not b_next!10339) (not b!437225))
(check-sat b_and!18281 (not b_next!10339))
