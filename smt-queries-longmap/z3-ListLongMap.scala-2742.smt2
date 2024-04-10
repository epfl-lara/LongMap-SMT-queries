; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40292 () Bool)

(assert start!40292)

(declare-fun b_free!10533 () Bool)

(declare-fun b_next!10533 () Bool)

(assert (=> start!40292 (= b_free!10533 (not b_next!10533))))

(declare-fun tp!37140 () Bool)

(declare-fun b_and!18517 () Bool)

(assert (=> start!40292 (= tp!37140 b_and!18517)))

(declare-fun b!442417 () Bool)

(declare-fun res!262037 () Bool)

(declare-fun e!260391 () Bool)

(assert (=> b!442417 (=> (not res!262037) (not e!260391))))

(declare-datatypes ((array!27195 0))(
  ( (array!27196 (arr!13046 (Array (_ BitVec 32) (_ BitVec 64))) (size!13398 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27195)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27195 (_ BitVec 32)) Bool)

(assert (=> b!442417 (= res!262037 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!442418 () Bool)

(declare-fun res!262039 () Bool)

(assert (=> b!442418 (=> (not res!262039) (not e!260391))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27195 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!442418 (= res!262039 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!442419 () Bool)

(declare-fun res!262029 () Bool)

(assert (=> b!442419 (=> (not res!262029) (not e!260391))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16693 0))(
  ( (V!16694 (val!5890 Int)) )
))
(declare-datatypes ((ValueCell!5502 0))(
  ( (ValueCellFull!5502 (v!8141 V!16693)) (EmptyCell!5502) )
))
(declare-datatypes ((array!27197 0))(
  ( (array!27198 (arr!13047 (Array (_ BitVec 32) ValueCell!5502)) (size!13399 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27197)

(assert (=> b!442419 (= res!262029 (and (= (size!13399 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13398 _keys!709) (size!13399 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!19161 () Bool)

(declare-fun mapRes!19161 () Bool)

(assert (=> mapIsEmpty!19161 mapRes!19161))

(declare-fun b!442420 () Bool)

(declare-fun e!260390 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!442420 (= e!260390 (and (not (= from!863 i!563)) (bvsge from!863 i!563)))))

(declare-fun minValue!515 () V!16693)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!7838 0))(
  ( (tuple2!7839 (_1!3930 (_ BitVec 64)) (_2!3930 V!16693)) )
))
(declare-datatypes ((List!7836 0))(
  ( (Nil!7833) (Cons!7832 (h!8688 tuple2!7838) (t!13594 List!7836)) )
))
(declare-datatypes ((ListLongMap!6751 0))(
  ( (ListLongMap!6752 (toList!3391 List!7836)) )
))
(declare-fun lt!203194 () ListLongMap!6751)

(declare-fun lt!203195 () array!27195)

(declare-fun zeroValue!515 () V!16693)

(declare-fun v!412 () V!16693)

(declare-fun getCurrentListMapNoExtraKeys!1580 (array!27195 array!27197 (_ BitVec 32) (_ BitVec 32) V!16693 V!16693 (_ BitVec 32) Int) ListLongMap!6751)

(assert (=> b!442420 (= lt!203194 (getCurrentListMapNoExtraKeys!1580 lt!203195 (array!27198 (store (arr!13047 _values!549) i!563 (ValueCellFull!5502 v!412)) (size!13399 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!203193 () ListLongMap!6751)

(assert (=> b!442420 (= lt!203193 (getCurrentListMapNoExtraKeys!1580 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!442421 () Bool)

(declare-fun res!262038 () Bool)

(assert (=> b!442421 (=> (not res!262038) (not e!260391))))

(assert (=> b!442421 (= res!262038 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13398 _keys!709))))))

(declare-fun b!442423 () Bool)

(declare-fun e!260388 () Bool)

(declare-fun tp_is_empty!11691 () Bool)

(assert (=> b!442423 (= e!260388 tp_is_empty!11691)))

(declare-fun b!442424 () Bool)

(declare-fun e!260392 () Bool)

(assert (=> b!442424 (= e!260392 (and e!260388 mapRes!19161))))

(declare-fun condMapEmpty!19161 () Bool)

(declare-fun mapDefault!19161 () ValueCell!5502)

(assert (=> b!442424 (= condMapEmpty!19161 (= (arr!13047 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5502)) mapDefault!19161)))))

(declare-fun b!442425 () Bool)

(declare-fun res!262030 () Bool)

(assert (=> b!442425 (=> (not res!262030) (not e!260391))))

(declare-datatypes ((List!7837 0))(
  ( (Nil!7834) (Cons!7833 (h!8689 (_ BitVec 64)) (t!13595 List!7837)) )
))
(declare-fun arrayNoDuplicates!0 (array!27195 (_ BitVec 32) List!7837) Bool)

(assert (=> b!442425 (= res!262030 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7834))))

(declare-fun b!442426 () Bool)

(declare-fun res!262034 () Bool)

(assert (=> b!442426 (=> (not res!262034) (not e!260390))))

(assert (=> b!442426 (= res!262034 (bvsle from!863 i!563))))

(declare-fun b!442427 () Bool)

(declare-fun res!262036 () Bool)

(assert (=> b!442427 (=> (not res!262036) (not e!260391))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!442427 (= res!262036 (validKeyInArray!0 k0!794))))

(declare-fun b!442428 () Bool)

(declare-fun res!262031 () Bool)

(assert (=> b!442428 (=> (not res!262031) (not e!260391))))

(assert (=> b!442428 (= res!262031 (or (= (select (arr!13046 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13046 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!442422 () Bool)

(declare-fun e!260387 () Bool)

(assert (=> b!442422 (= e!260387 tp_is_empty!11691)))

(declare-fun res!262033 () Bool)

(assert (=> start!40292 (=> (not res!262033) (not e!260391))))

(assert (=> start!40292 (= res!262033 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13398 _keys!709))))))

(assert (=> start!40292 e!260391))

(assert (=> start!40292 tp_is_empty!11691))

(assert (=> start!40292 tp!37140))

(assert (=> start!40292 true))

(declare-fun array_inv!9468 (array!27197) Bool)

(assert (=> start!40292 (and (array_inv!9468 _values!549) e!260392)))

(declare-fun array_inv!9469 (array!27195) Bool)

(assert (=> start!40292 (array_inv!9469 _keys!709)))

(declare-fun b!442429 () Bool)

(assert (=> b!442429 (= e!260391 e!260390)))

(declare-fun res!262035 () Bool)

(assert (=> b!442429 (=> (not res!262035) (not e!260390))))

(assert (=> b!442429 (= res!262035 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203195 mask!1025))))

(assert (=> b!442429 (= lt!203195 (array!27196 (store (arr!13046 _keys!709) i!563 k0!794) (size!13398 _keys!709)))))

(declare-fun b!442430 () Bool)

(declare-fun res!262040 () Bool)

(assert (=> b!442430 (=> (not res!262040) (not e!260391))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!442430 (= res!262040 (validMask!0 mask!1025))))

(declare-fun b!442431 () Bool)

(declare-fun res!262032 () Bool)

(assert (=> b!442431 (=> (not res!262032) (not e!260390))))

(assert (=> b!442431 (= res!262032 (arrayNoDuplicates!0 lt!203195 #b00000000000000000000000000000000 Nil!7834))))

(declare-fun mapNonEmpty!19161 () Bool)

(declare-fun tp!37139 () Bool)

(assert (=> mapNonEmpty!19161 (= mapRes!19161 (and tp!37139 e!260387))))

(declare-fun mapValue!19161 () ValueCell!5502)

(declare-fun mapRest!19161 () (Array (_ BitVec 32) ValueCell!5502))

(declare-fun mapKey!19161 () (_ BitVec 32))

(assert (=> mapNonEmpty!19161 (= (arr!13047 _values!549) (store mapRest!19161 mapKey!19161 mapValue!19161))))

(assert (= (and start!40292 res!262033) b!442430))

(assert (= (and b!442430 res!262040) b!442419))

(assert (= (and b!442419 res!262029) b!442417))

(assert (= (and b!442417 res!262037) b!442425))

(assert (= (and b!442425 res!262030) b!442421))

(assert (= (and b!442421 res!262038) b!442427))

(assert (= (and b!442427 res!262036) b!442428))

(assert (= (and b!442428 res!262031) b!442418))

(assert (= (and b!442418 res!262039) b!442429))

(assert (= (and b!442429 res!262035) b!442431))

(assert (= (and b!442431 res!262032) b!442426))

(assert (= (and b!442426 res!262034) b!442420))

(assert (= (and b!442424 condMapEmpty!19161) mapIsEmpty!19161))

(assert (= (and b!442424 (not condMapEmpty!19161)) mapNonEmpty!19161))

(get-info :version)

(assert (= (and mapNonEmpty!19161 ((_ is ValueCellFull!5502) mapValue!19161)) b!442422))

(assert (= (and b!442424 ((_ is ValueCellFull!5502) mapDefault!19161)) b!442423))

(assert (= start!40292 b!442424))

(declare-fun m!429079 () Bool)

(assert (=> b!442418 m!429079))

(declare-fun m!429081 () Bool)

(assert (=> b!442425 m!429081))

(declare-fun m!429083 () Bool)

(assert (=> b!442430 m!429083))

(declare-fun m!429085 () Bool)

(assert (=> b!442427 m!429085))

(declare-fun m!429087 () Bool)

(assert (=> b!442428 m!429087))

(declare-fun m!429089 () Bool)

(assert (=> b!442429 m!429089))

(declare-fun m!429091 () Bool)

(assert (=> b!442429 m!429091))

(declare-fun m!429093 () Bool)

(assert (=> start!40292 m!429093))

(declare-fun m!429095 () Bool)

(assert (=> start!40292 m!429095))

(declare-fun m!429097 () Bool)

(assert (=> mapNonEmpty!19161 m!429097))

(declare-fun m!429099 () Bool)

(assert (=> b!442417 m!429099))

(declare-fun m!429101 () Bool)

(assert (=> b!442431 m!429101))

(declare-fun m!429103 () Bool)

(assert (=> b!442420 m!429103))

(declare-fun m!429105 () Bool)

(assert (=> b!442420 m!429105))

(declare-fun m!429107 () Bool)

(assert (=> b!442420 m!429107))

(check-sat b_and!18517 (not b_next!10533) (not b!442427) (not b!442417) (not mapNonEmpty!19161) tp_is_empty!11691 (not b!442429) (not b!442418) (not b!442430) (not start!40292) (not b!442420) (not b!442425) (not b!442431))
(check-sat b_and!18517 (not b_next!10533))
