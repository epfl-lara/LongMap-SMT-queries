; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40656 () Bool)

(assert start!40656)

(declare-fun b_free!10681 () Bool)

(declare-fun b_next!10681 () Bool)

(assert (=> start!40656 (= b_free!10681 (not b_next!10681))))

(declare-fun tp!37863 () Bool)

(declare-fun b_and!18663 () Bool)

(assert (=> start!40656 (= tp!37863 b_and!18663)))

(declare-fun b!449221 () Bool)

(declare-fun res!267257 () Bool)

(declare-fun e!263374 () Bool)

(assert (=> b!449221 (=> (not res!267257) (not e!263374))))

(declare-datatypes ((array!27843 0))(
  ( (array!27844 (arr!13367 (Array (_ BitVec 32) (_ BitVec 64))) (size!13720 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27843)

(declare-datatypes ((List!8021 0))(
  ( (Nil!8018) (Cons!8017 (h!8873 (_ BitVec 64)) (t!13774 List!8021)) )
))
(declare-fun arrayNoDuplicates!0 (array!27843 (_ BitVec 32) List!8021) Bool)

(assert (=> b!449221 (= res!267257 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8018))))

(declare-fun b!449222 () Bool)

(declare-fun res!267249 () Bool)

(assert (=> b!449222 (=> (not res!267249) (not e!263374))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!449222 (= res!267249 (or (= (select (arr!13367 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13367 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!267253 () Bool)

(assert (=> start!40656 (=> (not res!267253) (not e!263374))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40656 (= res!267253 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13720 _keys!709))))))

(assert (=> start!40656 e!263374))

(declare-fun tp_is_empty!12019 () Bool)

(assert (=> start!40656 tp_is_empty!12019))

(assert (=> start!40656 tp!37863))

(assert (=> start!40656 true))

(declare-datatypes ((V!17131 0))(
  ( (V!17132 (val!6054 Int)) )
))
(declare-datatypes ((ValueCell!5666 0))(
  ( (ValueCellFull!5666 (v!8303 V!17131)) (EmptyCell!5666) )
))
(declare-datatypes ((array!27845 0))(
  ( (array!27846 (arr!13368 (Array (_ BitVec 32) ValueCell!5666)) (size!13721 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27845)

(declare-fun e!263376 () Bool)

(declare-fun array_inv!9744 (array!27845) Bool)

(assert (=> start!40656 (and (array_inv!9744 _values!549) e!263376)))

(declare-fun array_inv!9745 (array!27843) Bool)

(assert (=> start!40656 (array_inv!9745 _keys!709)))

(declare-fun mapIsEmpty!19662 () Bool)

(declare-fun mapRes!19662 () Bool)

(assert (=> mapIsEmpty!19662 mapRes!19662))

(declare-fun b!449223 () Bool)

(declare-fun res!267258 () Bool)

(assert (=> b!449223 (=> (not res!267258) (not e!263374))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!449223 (= res!267258 (validMask!0 mask!1025))))

(declare-fun b!449224 () Bool)

(declare-fun res!267248 () Bool)

(assert (=> b!449224 (=> (not res!267248) (not e!263374))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!449224 (= res!267248 (and (= (size!13721 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13720 _keys!709) (size!13721 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!19662 () Bool)

(declare-fun tp!37862 () Bool)

(declare-fun e!263373 () Bool)

(assert (=> mapNonEmpty!19662 (= mapRes!19662 (and tp!37862 e!263373))))

(declare-fun mapKey!19662 () (_ BitVec 32))

(declare-fun mapRest!19662 () (Array (_ BitVec 32) ValueCell!5666))

(declare-fun mapValue!19662 () ValueCell!5666)

(assert (=> mapNonEmpty!19662 (= (arr!13368 _values!549) (store mapRest!19662 mapKey!19662 mapValue!19662))))

(declare-fun b!449225 () Bool)

(declare-fun e!263378 () Bool)

(assert (=> b!449225 (= e!263374 e!263378)))

(declare-fun res!267252 () Bool)

(assert (=> b!449225 (=> (not res!267252) (not e!263378))))

(declare-fun lt!204144 () array!27843)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27843 (_ BitVec 32)) Bool)

(assert (=> b!449225 (= res!267252 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204144 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!449225 (= lt!204144 (array!27844 (store (arr!13367 _keys!709) i!563 k0!794) (size!13720 _keys!709)))))

(declare-fun b!449226 () Bool)

(assert (=> b!449226 (= e!263378 false)))

(declare-fun minValue!515 () V!17131)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!17131)

(declare-datatypes ((tuple2!7958 0))(
  ( (tuple2!7959 (_1!3990 (_ BitVec 64)) (_2!3990 V!17131)) )
))
(declare-datatypes ((List!8022 0))(
  ( (Nil!8019) (Cons!8018 (h!8874 tuple2!7958) (t!13775 List!8022)) )
))
(declare-datatypes ((ListLongMap!6861 0))(
  ( (ListLongMap!6862 (toList!3446 List!8022)) )
))
(declare-fun lt!204143 () ListLongMap!6861)

(declare-fun v!412 () V!17131)

(declare-fun getCurrentListMapNoExtraKeys!1644 (array!27843 array!27845 (_ BitVec 32) (_ BitVec 32) V!17131 V!17131 (_ BitVec 32) Int) ListLongMap!6861)

(assert (=> b!449226 (= lt!204143 (getCurrentListMapNoExtraKeys!1644 lt!204144 (array!27846 (store (arr!13368 _values!549) i!563 (ValueCellFull!5666 v!412)) (size!13721 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!204142 () ListLongMap!6861)

(assert (=> b!449226 (= lt!204142 (getCurrentListMapNoExtraKeys!1644 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!449227 () Bool)

(declare-fun e!263377 () Bool)

(assert (=> b!449227 (= e!263377 tp_is_empty!12019)))

(declare-fun b!449228 () Bool)

(declare-fun res!267254 () Bool)

(assert (=> b!449228 (=> (not res!267254) (not e!263374))))

(declare-fun arrayContainsKey!0 (array!27843 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!449228 (= res!267254 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!449229 () Bool)

(assert (=> b!449229 (= e!263373 tp_is_empty!12019)))

(declare-fun b!449230 () Bool)

(declare-fun res!267247 () Bool)

(assert (=> b!449230 (=> (not res!267247) (not e!263374))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!449230 (= res!267247 (validKeyInArray!0 k0!794))))

(declare-fun b!449231 () Bool)

(assert (=> b!449231 (= e!263376 (and e!263377 mapRes!19662))))

(declare-fun condMapEmpty!19662 () Bool)

(declare-fun mapDefault!19662 () ValueCell!5666)

(assert (=> b!449231 (= condMapEmpty!19662 (= (arr!13368 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5666)) mapDefault!19662)))))

(declare-fun b!449232 () Bool)

(declare-fun res!267256 () Bool)

(assert (=> b!449232 (=> (not res!267256) (not e!263378))))

(assert (=> b!449232 (= res!267256 (arrayNoDuplicates!0 lt!204144 #b00000000000000000000000000000000 Nil!8018))))

(declare-fun b!449233 () Bool)

(declare-fun res!267255 () Bool)

(assert (=> b!449233 (=> (not res!267255) (not e!263374))))

(assert (=> b!449233 (= res!267255 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13720 _keys!709))))))

(declare-fun b!449234 () Bool)

(declare-fun res!267251 () Bool)

(assert (=> b!449234 (=> (not res!267251) (not e!263374))))

(assert (=> b!449234 (= res!267251 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!449235 () Bool)

(declare-fun res!267250 () Bool)

(assert (=> b!449235 (=> (not res!267250) (not e!263378))))

(assert (=> b!449235 (= res!267250 (bvsle from!863 i!563))))

(assert (= (and start!40656 res!267253) b!449223))

(assert (= (and b!449223 res!267258) b!449224))

(assert (= (and b!449224 res!267248) b!449234))

(assert (= (and b!449234 res!267251) b!449221))

(assert (= (and b!449221 res!267257) b!449233))

(assert (= (and b!449233 res!267255) b!449230))

(assert (= (and b!449230 res!267247) b!449222))

(assert (= (and b!449222 res!267249) b!449228))

(assert (= (and b!449228 res!267254) b!449225))

(assert (= (and b!449225 res!267252) b!449232))

(assert (= (and b!449232 res!267256) b!449235))

(assert (= (and b!449235 res!267250) b!449226))

(assert (= (and b!449231 condMapEmpty!19662) mapIsEmpty!19662))

(assert (= (and b!449231 (not condMapEmpty!19662)) mapNonEmpty!19662))

(get-info :version)

(assert (= (and mapNonEmpty!19662 ((_ is ValueCellFull!5666) mapValue!19662)) b!449229))

(assert (= (and b!449231 ((_ is ValueCellFull!5666) mapDefault!19662)) b!449227))

(assert (= start!40656 b!449231))

(declare-fun m!432961 () Bool)

(assert (=> b!449232 m!432961))

(declare-fun m!432963 () Bool)

(assert (=> mapNonEmpty!19662 m!432963))

(declare-fun m!432965 () Bool)

(assert (=> b!449225 m!432965))

(declare-fun m!432967 () Bool)

(assert (=> b!449225 m!432967))

(declare-fun m!432969 () Bool)

(assert (=> b!449230 m!432969))

(declare-fun m!432971 () Bool)

(assert (=> start!40656 m!432971))

(declare-fun m!432973 () Bool)

(assert (=> start!40656 m!432973))

(declare-fun m!432975 () Bool)

(assert (=> b!449223 m!432975))

(declare-fun m!432977 () Bool)

(assert (=> b!449226 m!432977))

(declare-fun m!432979 () Bool)

(assert (=> b!449226 m!432979))

(declare-fun m!432981 () Bool)

(assert (=> b!449226 m!432981))

(declare-fun m!432983 () Bool)

(assert (=> b!449222 m!432983))

(declare-fun m!432985 () Bool)

(assert (=> b!449234 m!432985))

(declare-fun m!432987 () Bool)

(assert (=> b!449228 m!432987))

(declare-fun m!432989 () Bool)

(assert (=> b!449221 m!432989))

(check-sat (not b!449230) (not mapNonEmpty!19662) (not b!449226) (not b!449228) (not b!449234) (not b!449223) tp_is_empty!12019 (not start!40656) (not b_next!10681) (not b!449232) b_and!18663 (not b!449221) (not b!449225))
(check-sat b_and!18663 (not b_next!10681))
