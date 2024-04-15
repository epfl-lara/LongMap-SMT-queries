; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41140 () Bool)

(assert start!41140)

(declare-fun b_free!11023 () Bool)

(declare-fun b_next!11023 () Bool)

(assert (=> start!41140 (= b_free!11023 (not b_next!11023))))

(declare-fun tp!38904 () Bool)

(declare-fun b_and!19259 () Bool)

(assert (=> start!41140 (= tp!38904 b_and!19259)))

(declare-fun b!459248 () Bool)

(declare-datatypes ((Unit!13324 0))(
  ( (Unit!13325) )
))
(declare-fun e!268017 () Unit!13324)

(declare-fun Unit!13326 () Unit!13324)

(assert (=> b!459248 (= e!268017 Unit!13326)))

(declare-fun k0!794 () (_ BitVec 64))

(declare-datatypes ((array!28519 0))(
  ( (array!28520 (arr!13700 (Array (_ BitVec 32) (_ BitVec 64))) (size!14053 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28519)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lt!207677 () Unit!13324)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!28519 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!13324)

(assert (=> b!459248 (= lt!207677 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!459248 false))

(declare-fun b!459249 () Bool)

(declare-fun e!268014 () Bool)

(declare-fun tp_is_empty!12361 () Bool)

(assert (=> b!459249 (= e!268014 tp_is_empty!12361)))

(declare-fun b!459250 () Bool)

(declare-fun res!274496 () Bool)

(declare-fun e!268020 () Bool)

(assert (=> b!459250 (=> (not res!274496) (not e!268020))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28519 (_ BitVec 32)) Bool)

(assert (=> b!459250 (= res!274496 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!459251 () Bool)

(declare-fun res!274500 () Bool)

(assert (=> b!459251 (=> (not res!274500) (not e!268020))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!459251 (= res!274500 (validKeyInArray!0 k0!794))))

(declare-fun b!459252 () Bool)

(declare-fun e!268016 () Bool)

(declare-fun e!268019 () Bool)

(assert (=> b!459252 (= e!268016 (not e!268019))))

(declare-fun res!274494 () Bool)

(assert (=> b!459252 (=> res!274494 e!268019)))

(assert (=> b!459252 (= res!274494 (not (validKeyInArray!0 (select (arr!13700 _keys!709) from!863))))))

(declare-datatypes ((V!17587 0))(
  ( (V!17588 (val!6225 Int)) )
))
(declare-datatypes ((tuple2!8234 0))(
  ( (tuple2!8235 (_1!4128 (_ BitVec 64)) (_2!4128 V!17587)) )
))
(declare-datatypes ((List!8295 0))(
  ( (Nil!8292) (Cons!8291 (h!9147 tuple2!8234) (t!14188 List!8295)) )
))
(declare-datatypes ((ListLongMap!7137 0))(
  ( (ListLongMap!7138 (toList!3584 List!8295)) )
))
(declare-fun lt!207670 () ListLongMap!7137)

(declare-fun lt!207672 () ListLongMap!7137)

(assert (=> b!459252 (= lt!207670 lt!207672)))

(declare-fun lt!207676 () ListLongMap!7137)

(declare-fun v!412 () V!17587)

(declare-fun +!1636 (ListLongMap!7137 tuple2!8234) ListLongMap!7137)

(assert (=> b!459252 (= lt!207672 (+!1636 lt!207676 (tuple2!8235 k0!794 v!412)))))

(declare-fun minValue!515 () V!17587)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5837 0))(
  ( (ValueCellFull!5837 (v!8497 V!17587)) (EmptyCell!5837) )
))
(declare-datatypes ((array!28521 0))(
  ( (array!28522 (arr!13701 (Array (_ BitVec 32) ValueCell!5837)) (size!14054 (_ BitVec 32))) )
))
(declare-fun lt!207675 () array!28521)

(declare-fun zeroValue!515 () V!17587)

(declare-fun lt!207671 () array!28519)

(declare-fun getCurrentListMapNoExtraKeys!1778 (array!28519 array!28521 (_ BitVec 32) (_ BitVec 32) V!17587 V!17587 (_ BitVec 32) Int) ListLongMap!7137)

(assert (=> b!459252 (= lt!207670 (getCurrentListMapNoExtraKeys!1778 lt!207671 lt!207675 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun _values!549 () array!28521)

(assert (=> b!459252 (= lt!207676 (getCurrentListMapNoExtraKeys!1778 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun lt!207673 () Unit!13324)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!769 (array!28519 array!28521 (_ BitVec 32) (_ BitVec 32) V!17587 V!17587 (_ BitVec 32) (_ BitVec 64) V!17587 (_ BitVec 32) Int) Unit!13324)

(assert (=> b!459252 (= lt!207673 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!769 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!459253 () Bool)

(declare-fun res!274499 () Bool)

(assert (=> b!459253 (=> (not res!274499) (not e!268020))))

(declare-datatypes ((List!8296 0))(
  ( (Nil!8293) (Cons!8292 (h!9148 (_ BitVec 64)) (t!14189 List!8296)) )
))
(declare-fun arrayNoDuplicates!0 (array!28519 (_ BitVec 32) List!8296) Bool)

(assert (=> b!459253 (= res!274499 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8293))))

(declare-fun b!459254 () Bool)

(assert (=> b!459254 (= e!268019 (bvslt from!863 (size!14054 _values!549)))))

(assert (=> b!459254 (not (= (select (arr!13700 _keys!709) from!863) k0!794))))

(declare-fun lt!207674 () Unit!13324)

(assert (=> b!459254 (= lt!207674 e!268017)))

(declare-fun c!56412 () Bool)

(assert (=> b!459254 (= c!56412 (= (select (arr!13700 _keys!709) from!863) k0!794))))

(declare-fun lt!207669 () ListLongMap!7137)

(declare-fun get!6761 (ValueCell!5837 V!17587) V!17587)

(declare-fun dynLambda!896 (Int (_ BitVec 64)) V!17587)

(assert (=> b!459254 (= lt!207669 (+!1636 lt!207672 (tuple2!8235 (select (arr!13700 _keys!709) from!863) (get!6761 (select (arr!13701 _values!549) from!863) (dynLambda!896 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun mapNonEmpty!20191 () Bool)

(declare-fun mapRes!20191 () Bool)

(declare-fun tp!38905 () Bool)

(assert (=> mapNonEmpty!20191 (= mapRes!20191 (and tp!38905 e!268014))))

(declare-fun mapKey!20191 () (_ BitVec 32))

(declare-fun mapValue!20191 () ValueCell!5837)

(declare-fun mapRest!20191 () (Array (_ BitVec 32) ValueCell!5837))

(assert (=> mapNonEmpty!20191 (= (arr!13701 _values!549) (store mapRest!20191 mapKey!20191 mapValue!20191))))

(declare-fun b!459255 () Bool)

(declare-fun res!274507 () Bool)

(declare-fun e!268012 () Bool)

(assert (=> b!459255 (=> (not res!274507) (not e!268012))))

(assert (=> b!459255 (= res!274507 (bvsle from!863 i!563))))

(declare-fun b!459256 () Bool)

(assert (=> b!459256 (= e!268020 e!268012)))

(declare-fun res!274498 () Bool)

(assert (=> b!459256 (=> (not res!274498) (not e!268012))))

(assert (=> b!459256 (= res!274498 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!207671 mask!1025))))

(assert (=> b!459256 (= lt!207671 (array!28520 (store (arr!13700 _keys!709) i!563 k0!794) (size!14053 _keys!709)))))

(declare-fun b!459257 () Bool)

(declare-fun res!274504 () Bool)

(assert (=> b!459257 (=> (not res!274504) (not e!268020))))

(assert (=> b!459257 (= res!274504 (and (= (size!14054 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!14053 _keys!709) (size!14054 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!459258 () Bool)

(declare-fun res!274505 () Bool)

(assert (=> b!459258 (=> (not res!274505) (not e!268012))))

(assert (=> b!459258 (= res!274505 (arrayNoDuplicates!0 lt!207671 #b00000000000000000000000000000000 Nil!8293))))

(declare-fun b!459259 () Bool)

(declare-fun res!274502 () Bool)

(assert (=> b!459259 (=> (not res!274502) (not e!268020))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!459259 (= res!274502 (validMask!0 mask!1025))))

(declare-fun b!459260 () Bool)

(declare-fun res!274495 () Bool)

(assert (=> b!459260 (=> (not res!274495) (not e!268020))))

(assert (=> b!459260 (= res!274495 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14053 _keys!709))))))

(declare-fun b!459261 () Bool)

(assert (=> b!459261 (= e!268012 e!268016)))

(declare-fun res!274501 () Bool)

(assert (=> b!459261 (=> (not res!274501) (not e!268016))))

(assert (=> b!459261 (= res!274501 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!459261 (= lt!207669 (getCurrentListMapNoExtraKeys!1778 lt!207671 lt!207675 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!459261 (= lt!207675 (array!28522 (store (arr!13701 _values!549) i!563 (ValueCellFull!5837 v!412)) (size!14054 _values!549)))))

(declare-fun lt!207668 () ListLongMap!7137)

(assert (=> b!459261 (= lt!207668 (getCurrentListMapNoExtraKeys!1778 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapIsEmpty!20191 () Bool)

(assert (=> mapIsEmpty!20191 mapRes!20191))

(declare-fun b!459262 () Bool)

(declare-fun res!274503 () Bool)

(assert (=> b!459262 (=> (not res!274503) (not e!268020))))

(assert (=> b!459262 (= res!274503 (or (= (select (arr!13700 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13700 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!459263 () Bool)

(declare-fun res!274506 () Bool)

(assert (=> b!459263 (=> (not res!274506) (not e!268020))))

(declare-fun arrayContainsKey!0 (array!28519 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!459263 (= res!274506 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun res!274497 () Bool)

(assert (=> start!41140 (=> (not res!274497) (not e!268020))))

(assert (=> start!41140 (= res!274497 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!14053 _keys!709))))))

(assert (=> start!41140 e!268020))

(assert (=> start!41140 tp_is_empty!12361))

(assert (=> start!41140 tp!38904))

(assert (=> start!41140 true))

(declare-fun e!268018 () Bool)

(declare-fun array_inv!9976 (array!28521) Bool)

(assert (=> start!41140 (and (array_inv!9976 _values!549) e!268018)))

(declare-fun array_inv!9977 (array!28519) Bool)

(assert (=> start!41140 (array_inv!9977 _keys!709)))

(declare-fun b!459264 () Bool)

(declare-fun e!268013 () Bool)

(assert (=> b!459264 (= e!268013 tp_is_empty!12361)))

(declare-fun b!459265 () Bool)

(declare-fun Unit!13327 () Unit!13324)

(assert (=> b!459265 (= e!268017 Unit!13327)))

(declare-fun b!459266 () Bool)

(assert (=> b!459266 (= e!268018 (and e!268013 mapRes!20191))))

(declare-fun condMapEmpty!20191 () Bool)

(declare-fun mapDefault!20191 () ValueCell!5837)

(assert (=> b!459266 (= condMapEmpty!20191 (= (arr!13701 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5837)) mapDefault!20191)))))

(assert (= (and start!41140 res!274497) b!459259))

(assert (= (and b!459259 res!274502) b!459257))

(assert (= (and b!459257 res!274504) b!459250))

(assert (= (and b!459250 res!274496) b!459253))

(assert (= (and b!459253 res!274499) b!459260))

(assert (= (and b!459260 res!274495) b!459251))

(assert (= (and b!459251 res!274500) b!459262))

(assert (= (and b!459262 res!274503) b!459263))

(assert (= (and b!459263 res!274506) b!459256))

(assert (= (and b!459256 res!274498) b!459258))

(assert (= (and b!459258 res!274505) b!459255))

(assert (= (and b!459255 res!274507) b!459261))

(assert (= (and b!459261 res!274501) b!459252))

(assert (= (and b!459252 (not res!274494)) b!459254))

(assert (= (and b!459254 c!56412) b!459248))

(assert (= (and b!459254 (not c!56412)) b!459265))

(assert (= (and b!459266 condMapEmpty!20191) mapIsEmpty!20191))

(assert (= (and b!459266 (not condMapEmpty!20191)) mapNonEmpty!20191))

(get-info :version)

(assert (= (and mapNonEmpty!20191 ((_ is ValueCellFull!5837) mapValue!20191)) b!459249))

(assert (= (and b!459266 ((_ is ValueCellFull!5837) mapDefault!20191)) b!459264))

(assert (= start!41140 b!459266))

(declare-fun b_lambda!9839 () Bool)

(assert (=> (not b_lambda!9839) (not b!459254)))

(declare-fun t!14187 () Bool)

(declare-fun tb!3851 () Bool)

(assert (=> (and start!41140 (= defaultEntry!557 defaultEntry!557) t!14187) tb!3851))

(declare-fun result!7255 () Bool)

(assert (=> tb!3851 (= result!7255 tp_is_empty!12361)))

(assert (=> b!459254 t!14187))

(declare-fun b_and!19261 () Bool)

(assert (= b_and!19259 (and (=> t!14187 result!7255) b_and!19261)))

(declare-fun m!442057 () Bool)

(assert (=> b!459256 m!442057))

(declare-fun m!442059 () Bool)

(assert (=> b!459256 m!442059))

(declare-fun m!442061 () Bool)

(assert (=> b!459251 m!442061))

(declare-fun m!442063 () Bool)

(assert (=> mapNonEmpty!20191 m!442063))

(declare-fun m!442065 () Bool)

(assert (=> b!459250 m!442065))

(declare-fun m!442067 () Bool)

(assert (=> b!459248 m!442067))

(declare-fun m!442069 () Bool)

(assert (=> b!459259 m!442069))

(declare-fun m!442071 () Bool)

(assert (=> start!41140 m!442071))

(declare-fun m!442073 () Bool)

(assert (=> start!41140 m!442073))

(declare-fun m!442075 () Bool)

(assert (=> b!459262 m!442075))

(declare-fun m!442077 () Bool)

(assert (=> b!459258 m!442077))

(declare-fun m!442079 () Bool)

(assert (=> b!459252 m!442079))

(declare-fun m!442081 () Bool)

(assert (=> b!459252 m!442081))

(declare-fun m!442083 () Bool)

(assert (=> b!459252 m!442083))

(declare-fun m!442085 () Bool)

(assert (=> b!459252 m!442085))

(assert (=> b!459252 m!442079))

(declare-fun m!442087 () Bool)

(assert (=> b!459252 m!442087))

(declare-fun m!442089 () Bool)

(assert (=> b!459252 m!442089))

(declare-fun m!442091 () Bool)

(assert (=> b!459253 m!442091))

(declare-fun m!442093 () Bool)

(assert (=> b!459263 m!442093))

(declare-fun m!442095 () Bool)

(assert (=> b!459261 m!442095))

(declare-fun m!442097 () Bool)

(assert (=> b!459261 m!442097))

(declare-fun m!442099 () Bool)

(assert (=> b!459261 m!442099))

(assert (=> b!459254 m!442079))

(declare-fun m!442101 () Bool)

(assert (=> b!459254 m!442101))

(declare-fun m!442103 () Bool)

(assert (=> b!459254 m!442103))

(declare-fun m!442105 () Bool)

(assert (=> b!459254 m!442105))

(assert (=> b!459254 m!442105))

(assert (=> b!459254 m!442103))

(declare-fun m!442107 () Bool)

(assert (=> b!459254 m!442107))

(check-sat (not b!459256) (not b!459248) tp_is_empty!12361 (not b!459252) (not b!459251) (not b!459254) (not b!459259) (not b!459250) (not b_next!11023) (not b!459253) b_and!19261 (not b!459263) (not b_lambda!9839) (not mapNonEmpty!20191) (not start!41140) (not b!459258) (not b!459261))
(check-sat b_and!19261 (not b_next!11023))
