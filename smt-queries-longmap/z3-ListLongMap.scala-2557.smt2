; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39162 () Bool)

(assert start!39162)

(declare-fun b_free!9429 () Bool)

(declare-fun b_next!9429 () Bool)

(assert (=> start!39162 (= b_free!9429 (not b_next!9429))))

(declare-fun tp!33815 () Bool)

(declare-fun b_and!16815 () Bool)

(assert (=> start!39162 (= tp!33815 b_and!16815)))

(declare-fun b!412257 () Bool)

(declare-fun res!239351 () Bool)

(declare-fun e!246738 () Bool)

(assert (=> b!412257 (=> (not res!239351) (not e!246738))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!25023 0))(
  ( (array!25024 (arr!11961 (Array (_ BitVec 32) (_ BitVec 64))) (size!12313 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25023)

(assert (=> b!412257 (= res!239351 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12313 _keys!709))))))

(declare-fun b!412258 () Bool)

(declare-fun res!239348 () Bool)

(declare-fun e!246737 () Bool)

(assert (=> b!412258 (=> (not res!239348) (not e!246737))))

(declare-fun lt!189445 () array!25023)

(declare-datatypes ((List!6946 0))(
  ( (Nil!6943) (Cons!6942 (h!7798 (_ BitVec 64)) (t!12120 List!6946)) )
))
(declare-fun arrayNoDuplicates!0 (array!25023 (_ BitVec 32) List!6946) Bool)

(assert (=> b!412258 (= res!239348 (arrayNoDuplicates!0 lt!189445 #b00000000000000000000000000000000 Nil!6943))))

(declare-fun b!412259 () Bool)

(declare-fun res!239350 () Bool)

(assert (=> b!412259 (=> (not res!239350) (not e!246738))))

(assert (=> b!412259 (= res!239350 (or (= (select (arr!11961 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11961 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!17493 () Bool)

(declare-fun mapRes!17493 () Bool)

(declare-fun tp!33816 () Bool)

(declare-fun e!246735 () Bool)

(assert (=> mapNonEmpty!17493 (= mapRes!17493 (and tp!33816 e!246735))))

(declare-datatypes ((V!15213 0))(
  ( (V!15214 (val!5335 Int)) )
))
(declare-datatypes ((ValueCell!4947 0))(
  ( (ValueCellFull!4947 (v!7582 V!15213)) (EmptyCell!4947) )
))
(declare-fun mapRest!17493 () (Array (_ BitVec 32) ValueCell!4947))

(declare-fun mapValue!17493 () ValueCell!4947)

(declare-datatypes ((array!25025 0))(
  ( (array!25026 (arr!11962 (Array (_ BitVec 32) ValueCell!4947)) (size!12314 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25025)

(declare-fun mapKey!17493 () (_ BitVec 32))

(assert (=> mapNonEmpty!17493 (= (arr!11962 _values!549) (store mapRest!17493 mapKey!17493 mapValue!17493))))

(declare-fun b!412260 () Bool)

(declare-fun res!239346 () Bool)

(assert (=> b!412260 (=> (not res!239346) (not e!246738))))

(assert (=> b!412260 (= res!239346 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6943))))

(declare-fun b!412261 () Bool)

(declare-fun res!239349 () Bool)

(assert (=> b!412261 (=> (not res!239349) (not e!246738))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!412261 (= res!239349 (validMask!0 mask!1025))))

(declare-fun b!412262 () Bool)

(declare-fun e!246736 () Bool)

(declare-fun tp_is_empty!10581 () Bool)

(assert (=> b!412262 (= e!246736 tp_is_empty!10581)))

(declare-fun res!239354 () Bool)

(assert (=> start!39162 (=> (not res!239354) (not e!246738))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39162 (= res!239354 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12313 _keys!709))))))

(assert (=> start!39162 e!246738))

(assert (=> start!39162 tp_is_empty!10581))

(assert (=> start!39162 tp!33815))

(assert (=> start!39162 true))

(declare-fun e!246734 () Bool)

(declare-fun array_inv!8722 (array!25025) Bool)

(assert (=> start!39162 (and (array_inv!8722 _values!549) e!246734)))

(declare-fun array_inv!8723 (array!25023) Bool)

(assert (=> start!39162 (array_inv!8723 _keys!709)))

(declare-fun b!412263 () Bool)

(declare-fun res!239345 () Bool)

(assert (=> b!412263 (=> (not res!239345) (not e!246738))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25023 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!412263 (= res!239345 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!412264 () Bool)

(declare-fun res!239352 () Bool)

(assert (=> b!412264 (=> (not res!239352) (not e!246738))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!412264 (= res!239352 (and (= (size!12314 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12313 _keys!709) (size!12314 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!412265 () Bool)

(declare-fun res!239347 () Bool)

(assert (=> b!412265 (=> (not res!239347) (not e!246738))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25023 (_ BitVec 32)) Bool)

(assert (=> b!412265 (= res!239347 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!412266 () Bool)

(assert (=> b!412266 (= e!246738 e!246737)))

(declare-fun res!239353 () Bool)

(assert (=> b!412266 (=> (not res!239353) (not e!246737))))

(assert (=> b!412266 (= res!239353 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189445 mask!1025))))

(assert (=> b!412266 (= lt!189445 (array!25024 (store (arr!11961 _keys!709) i!563 k0!794) (size!12313 _keys!709)))))

(declare-fun b!412267 () Bool)

(declare-fun res!239344 () Bool)

(assert (=> b!412267 (=> (not res!239344) (not e!246737))))

(assert (=> b!412267 (= res!239344 (bvsle from!863 i!563))))

(declare-fun b!412268 () Bool)

(assert (=> b!412268 (= e!246737 false)))

(declare-fun minValue!515 () V!15213)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!6920 0))(
  ( (tuple2!6921 (_1!3471 (_ BitVec 64)) (_2!3471 V!15213)) )
))
(declare-datatypes ((List!6947 0))(
  ( (Nil!6944) (Cons!6943 (h!7799 tuple2!6920) (t!12121 List!6947)) )
))
(declare-datatypes ((ListLongMap!5833 0))(
  ( (ListLongMap!5834 (toList!2932 List!6947)) )
))
(declare-fun lt!189444 () ListLongMap!5833)

(declare-fun zeroValue!515 () V!15213)

(declare-fun v!412 () V!15213)

(declare-fun getCurrentListMapNoExtraKeys!1140 (array!25023 array!25025 (_ BitVec 32) (_ BitVec 32) V!15213 V!15213 (_ BitVec 32) Int) ListLongMap!5833)

(assert (=> b!412268 (= lt!189444 (getCurrentListMapNoExtraKeys!1140 lt!189445 (array!25026 (store (arr!11962 _values!549) i!563 (ValueCellFull!4947 v!412)) (size!12314 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!189446 () ListLongMap!5833)

(assert (=> b!412268 (= lt!189446 (getCurrentListMapNoExtraKeys!1140 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!412269 () Bool)

(assert (=> b!412269 (= e!246735 tp_is_empty!10581)))

(declare-fun mapIsEmpty!17493 () Bool)

(assert (=> mapIsEmpty!17493 mapRes!17493))

(declare-fun b!412270 () Bool)

(declare-fun res!239355 () Bool)

(assert (=> b!412270 (=> (not res!239355) (not e!246738))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!412270 (= res!239355 (validKeyInArray!0 k0!794))))

(declare-fun b!412271 () Bool)

(assert (=> b!412271 (= e!246734 (and e!246736 mapRes!17493))))

(declare-fun condMapEmpty!17493 () Bool)

(declare-fun mapDefault!17493 () ValueCell!4947)

(assert (=> b!412271 (= condMapEmpty!17493 (= (arr!11962 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4947)) mapDefault!17493)))))

(assert (= (and start!39162 res!239354) b!412261))

(assert (= (and b!412261 res!239349) b!412264))

(assert (= (and b!412264 res!239352) b!412265))

(assert (= (and b!412265 res!239347) b!412260))

(assert (= (and b!412260 res!239346) b!412257))

(assert (= (and b!412257 res!239351) b!412270))

(assert (= (and b!412270 res!239355) b!412259))

(assert (= (and b!412259 res!239350) b!412263))

(assert (= (and b!412263 res!239345) b!412266))

(assert (= (and b!412266 res!239353) b!412258))

(assert (= (and b!412258 res!239348) b!412267))

(assert (= (and b!412267 res!239344) b!412268))

(assert (= (and b!412271 condMapEmpty!17493) mapIsEmpty!17493))

(assert (= (and b!412271 (not condMapEmpty!17493)) mapNonEmpty!17493))

(get-info :version)

(assert (= (and mapNonEmpty!17493 ((_ is ValueCellFull!4947) mapValue!17493)) b!412269))

(assert (= (and b!412271 ((_ is ValueCellFull!4947) mapDefault!17493)) b!412262))

(assert (= start!39162 b!412271))

(declare-fun m!402133 () Bool)

(assert (=> b!412266 m!402133))

(declare-fun m!402135 () Bool)

(assert (=> b!412266 m!402135))

(declare-fun m!402137 () Bool)

(assert (=> b!412268 m!402137))

(declare-fun m!402139 () Bool)

(assert (=> b!412268 m!402139))

(declare-fun m!402141 () Bool)

(assert (=> b!412268 m!402141))

(declare-fun m!402143 () Bool)

(assert (=> b!412260 m!402143))

(declare-fun m!402145 () Bool)

(assert (=> start!39162 m!402145))

(declare-fun m!402147 () Bool)

(assert (=> start!39162 m!402147))

(declare-fun m!402149 () Bool)

(assert (=> b!412263 m!402149))

(declare-fun m!402151 () Bool)

(assert (=> b!412259 m!402151))

(declare-fun m!402153 () Bool)

(assert (=> b!412270 m!402153))

(declare-fun m!402155 () Bool)

(assert (=> b!412258 m!402155))

(declare-fun m!402157 () Bool)

(assert (=> b!412265 m!402157))

(declare-fun m!402159 () Bool)

(assert (=> b!412261 m!402159))

(declare-fun m!402161 () Bool)

(assert (=> mapNonEmpty!17493 m!402161))

(check-sat (not b!412258) (not b!412260) (not b!412270) b_and!16815 (not b_next!9429) (not b!412266) tp_is_empty!10581 (not b!412265) (not b!412263) (not b!412268) (not start!39162) (not b!412261) (not mapNonEmpty!17493))
(check-sat b_and!16815 (not b_next!9429))
