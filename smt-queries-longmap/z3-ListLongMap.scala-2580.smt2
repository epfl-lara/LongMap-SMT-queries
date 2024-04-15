; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39284 () Bool)

(assert start!39284)

(declare-fun b_free!9565 () Bool)

(declare-fun b_next!9565 () Bool)

(assert (=> start!39284 (= b_free!9565 (not b_next!9565))))

(declare-fun tp!34224 () Bool)

(declare-fun b_and!16979 () Bool)

(assert (=> start!39284 (= tp!34224 b_and!16979)))

(declare-datatypes ((V!15395 0))(
  ( (V!15396 (val!5403 Int)) )
))
(declare-datatypes ((tuple2!7026 0))(
  ( (tuple2!7027 (_1!3524 (_ BitVec 64)) (_2!3524 V!15395)) )
))
(declare-datatypes ((List!7033 0))(
  ( (Nil!7030) (Cons!7029 (h!7885 tuple2!7026) (t!12254 List!7033)) )
))
(declare-datatypes ((ListLongMap!5929 0))(
  ( (ListLongMap!5930 (toList!2980 List!7033)) )
))
(declare-fun call!28848 () ListLongMap!5929)

(declare-fun e!248208 () Bool)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun v!412 () V!15395)

(declare-fun call!28849 () ListLongMap!5929)

(declare-fun b!415684 () Bool)

(declare-fun +!1211 (ListLongMap!5929 tuple2!7026) ListLongMap!5929)

(assert (=> b!415684 (= e!248208 (= call!28848 (+!1211 call!28849 (tuple2!7027 k0!794 v!412))))))

(declare-fun mapIsEmpty!17697 () Bool)

(declare-fun mapRes!17697 () Bool)

(assert (=> mapIsEmpty!17697 mapRes!17697))

(declare-fun b!415685 () Bool)

(declare-fun res!241922 () Bool)

(declare-fun e!248206 () Bool)

(assert (=> b!415685 (=> (not res!241922) (not e!248206))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!415685 (= res!241922 (validMask!0 mask!1025))))

(declare-fun b!415686 () Bool)

(declare-fun e!248210 () Bool)

(declare-fun tp_is_empty!10717 () Bool)

(assert (=> b!415686 (= e!248210 tp_is_empty!10717)))

(declare-fun b!415687 () Bool)

(declare-fun res!241929 () Bool)

(assert (=> b!415687 (=> (not res!241929) (not e!248206))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!415687 (= res!241929 (validKeyInArray!0 k0!794))))

(declare-fun b!415688 () Bool)

(declare-fun e!248205 () Bool)

(assert (=> b!415688 (= e!248205 tp_is_empty!10717)))

(declare-fun b!415689 () Bool)

(declare-fun res!241925 () Bool)

(declare-fun e!248203 () Bool)

(assert (=> b!415689 (=> (not res!241925) (not e!248203))))

(declare-datatypes ((array!25281 0))(
  ( (array!25282 (arr!12090 (Array (_ BitVec 32) (_ BitVec 64))) (size!12443 (_ BitVec 32))) )
))
(declare-fun lt!190170 () array!25281)

(declare-datatypes ((List!7034 0))(
  ( (Nil!7031) (Cons!7030 (h!7886 (_ BitVec 64)) (t!12255 List!7034)) )
))
(declare-fun arrayNoDuplicates!0 (array!25281 (_ BitVec 32) List!7034) Bool)

(assert (=> b!415689 (= res!241925 (arrayNoDuplicates!0 lt!190170 #b00000000000000000000000000000000 Nil!7031))))

(declare-fun b!415690 () Bool)

(assert (=> b!415690 (= e!248208 (= call!28849 call!28848))))

(declare-fun res!241919 () Bool)

(assert (=> start!39284 (=> (not res!241919) (not e!248206))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun _keys!709 () array!25281)

(assert (=> start!39284 (= res!241919 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12443 _keys!709))))))

(assert (=> start!39284 e!248206))

(assert (=> start!39284 tp_is_empty!10717))

(assert (=> start!39284 tp!34224))

(assert (=> start!39284 true))

(declare-datatypes ((ValueCell!5015 0))(
  ( (ValueCellFull!5015 (v!7644 V!15395)) (EmptyCell!5015) )
))
(declare-datatypes ((array!25283 0))(
  ( (array!25284 (arr!12091 (Array (_ BitVec 32) ValueCell!5015)) (size!12444 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25283)

(declare-fun e!248207 () Bool)

(declare-fun array_inv!8858 (array!25283) Bool)

(assert (=> start!39284 (and (array_inv!8858 _values!549) e!248207)))

(declare-fun array_inv!8859 (array!25281) Bool)

(assert (=> start!39284 (array_inv!8859 _keys!709)))

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun c!54990 () Bool)

(declare-fun zeroValue!515 () V!15395)

(declare-fun minValue!515 () V!15395)

(declare-fun bm!28845 () Bool)

(declare-fun lt!190163 () array!25283)

(declare-fun getCurrentListMapNoExtraKeys!1191 (array!25281 array!25283 (_ BitVec 32) (_ BitVec 32) V!15395 V!15395 (_ BitVec 32) Int) ListLongMap!5929)

(assert (=> bm!28845 (= call!28848 (getCurrentListMapNoExtraKeys!1191 (ite c!54990 lt!190170 _keys!709) (ite c!54990 lt!190163 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!415691 () Bool)

(declare-fun e!248209 () Bool)

(assert (=> b!415691 (= e!248209 true)))

(declare-fun lt!190168 () tuple2!7026)

(declare-fun lt!190172 () V!15395)

(declare-fun lt!190166 () ListLongMap!5929)

(assert (=> b!415691 (= (+!1211 lt!190166 lt!190168) (+!1211 (+!1211 lt!190166 (tuple2!7027 k0!794 lt!190172)) lt!190168))))

(declare-fun lt!190167 () V!15395)

(assert (=> b!415691 (= lt!190168 (tuple2!7027 k0!794 lt!190167))))

(declare-datatypes ((Unit!12262 0))(
  ( (Unit!12263) )
))
(declare-fun lt!190171 () Unit!12262)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!1 (ListLongMap!5929 (_ BitVec 64) V!15395 V!15395) Unit!12262)

(assert (=> b!415691 (= lt!190171 (addSameAsAddTwiceSameKeyDiffValues!1 lt!190166 k0!794 lt!190172 lt!190167))))

(declare-fun lt!190169 () V!15395)

(declare-fun get!5964 (ValueCell!5015 V!15395) V!15395)

(assert (=> b!415691 (= lt!190172 (get!5964 (select (arr!12091 _values!549) from!863) lt!190169))))

(declare-fun lt!190162 () ListLongMap!5929)

(assert (=> b!415691 (= lt!190162 (+!1211 lt!190166 (tuple2!7027 (select (arr!12090 lt!190170) from!863) lt!190167)))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!415691 (= lt!190167 (get!5964 (select (store (arr!12091 _values!549) i!563 (ValueCellFull!5015 v!412)) from!863) lt!190169))))

(declare-fun dynLambda!658 (Int (_ BitVec 64)) V!15395)

(assert (=> b!415691 (= lt!190169 (dynLambda!658 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!415691 (= lt!190166 (getCurrentListMapNoExtraKeys!1191 lt!190170 lt!190163 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!415692 () Bool)

(declare-fun e!248211 () Bool)

(assert (=> b!415692 (= e!248203 e!248211)))

(declare-fun res!241920 () Bool)

(assert (=> b!415692 (=> (not res!241920) (not e!248211))))

(assert (=> b!415692 (= res!241920 (= from!863 i!563))))

(assert (=> b!415692 (= lt!190162 (getCurrentListMapNoExtraKeys!1191 lt!190170 lt!190163 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!415692 (= lt!190163 (array!25284 (store (arr!12091 _values!549) i!563 (ValueCellFull!5015 v!412)) (size!12444 _values!549)))))

(declare-fun lt!190165 () ListLongMap!5929)

(assert (=> b!415692 (= lt!190165 (getCurrentListMapNoExtraKeys!1191 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!415693 () Bool)

(declare-fun res!241927 () Bool)

(assert (=> b!415693 (=> (not res!241927) (not e!248206))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25281 (_ BitVec 32)) Bool)

(assert (=> b!415693 (= res!241927 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!415694 () Bool)

(declare-fun res!241928 () Bool)

(assert (=> b!415694 (=> (not res!241928) (not e!248203))))

(assert (=> b!415694 (= res!241928 (bvsle from!863 i!563))))

(declare-fun b!415695 () Bool)

(declare-fun res!241931 () Bool)

(assert (=> b!415695 (=> (not res!241931) (not e!248206))))

(declare-fun arrayContainsKey!0 (array!25281 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!415695 (= res!241931 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!415696 () Bool)

(assert (=> b!415696 (= e!248211 (not e!248209))))

(declare-fun res!241924 () Bool)

(assert (=> b!415696 (=> res!241924 e!248209)))

(assert (=> b!415696 (= res!241924 (validKeyInArray!0 (select (arr!12090 _keys!709) from!863)))))

(assert (=> b!415696 e!248208))

(assert (=> b!415696 (= c!54990 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun lt!190164 () Unit!12262)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!394 (array!25281 array!25283 (_ BitVec 32) (_ BitVec 32) V!15395 V!15395 (_ BitVec 32) (_ BitVec 64) V!15395 (_ BitVec 32) Int) Unit!12262)

(assert (=> b!415696 (= lt!190164 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!394 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!415697 () Bool)

(declare-fun res!241932 () Bool)

(assert (=> b!415697 (=> (not res!241932) (not e!248206))))

(assert (=> b!415697 (= res!241932 (and (= (size!12444 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12443 _keys!709) (size!12444 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!415698 () Bool)

(declare-fun res!241923 () Bool)

(assert (=> b!415698 (=> (not res!241923) (not e!248206))))

(assert (=> b!415698 (= res!241923 (or (= (select (arr!12090 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12090 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!415699 () Bool)

(declare-fun res!241930 () Bool)

(assert (=> b!415699 (=> (not res!241930) (not e!248206))))

(assert (=> b!415699 (= res!241930 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7031))))

(declare-fun mapNonEmpty!17697 () Bool)

(declare-fun tp!34223 () Bool)

(assert (=> mapNonEmpty!17697 (= mapRes!17697 (and tp!34223 e!248205))))

(declare-fun mapKey!17697 () (_ BitVec 32))

(declare-fun mapRest!17697 () (Array (_ BitVec 32) ValueCell!5015))

(declare-fun mapValue!17697 () ValueCell!5015)

(assert (=> mapNonEmpty!17697 (= (arr!12091 _values!549) (store mapRest!17697 mapKey!17697 mapValue!17697))))

(declare-fun b!415700 () Bool)

(assert (=> b!415700 (= e!248206 e!248203)))

(declare-fun res!241921 () Bool)

(assert (=> b!415700 (=> (not res!241921) (not e!248203))))

(assert (=> b!415700 (= res!241921 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!190170 mask!1025))))

(assert (=> b!415700 (= lt!190170 (array!25282 (store (arr!12090 _keys!709) i!563 k0!794) (size!12443 _keys!709)))))

(declare-fun bm!28846 () Bool)

(assert (=> bm!28846 (= call!28849 (getCurrentListMapNoExtraKeys!1191 (ite c!54990 _keys!709 lt!190170) (ite c!54990 _values!549 lt!190163) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!415701 () Bool)

(assert (=> b!415701 (= e!248207 (and e!248210 mapRes!17697))))

(declare-fun condMapEmpty!17697 () Bool)

(declare-fun mapDefault!17697 () ValueCell!5015)

(assert (=> b!415701 (= condMapEmpty!17697 (= (arr!12091 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5015)) mapDefault!17697)))))

(declare-fun b!415702 () Bool)

(declare-fun res!241926 () Bool)

(assert (=> b!415702 (=> (not res!241926) (not e!248206))))

(assert (=> b!415702 (= res!241926 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12443 _keys!709))))))

(assert (= (and start!39284 res!241919) b!415685))

(assert (= (and b!415685 res!241922) b!415697))

(assert (= (and b!415697 res!241932) b!415693))

(assert (= (and b!415693 res!241927) b!415699))

(assert (= (and b!415699 res!241930) b!415702))

(assert (= (and b!415702 res!241926) b!415687))

(assert (= (and b!415687 res!241929) b!415698))

(assert (= (and b!415698 res!241923) b!415695))

(assert (= (and b!415695 res!241931) b!415700))

(assert (= (and b!415700 res!241921) b!415689))

(assert (= (and b!415689 res!241925) b!415694))

(assert (= (and b!415694 res!241928) b!415692))

(assert (= (and b!415692 res!241920) b!415696))

(assert (= (and b!415696 c!54990) b!415684))

(assert (= (and b!415696 (not c!54990)) b!415690))

(assert (= (or b!415684 b!415690) bm!28845))

(assert (= (or b!415684 b!415690) bm!28846))

(assert (= (and b!415696 (not res!241924)) b!415691))

(assert (= (and b!415701 condMapEmpty!17697) mapIsEmpty!17697))

(assert (= (and b!415701 (not condMapEmpty!17697)) mapNonEmpty!17697))

(get-info :version)

(assert (= (and mapNonEmpty!17697 ((_ is ValueCellFull!5015) mapValue!17697)) b!415688))

(assert (= (and b!415701 ((_ is ValueCellFull!5015) mapDefault!17697)) b!415686))

(assert (= start!39284 b!415701))

(declare-fun b_lambda!8851 () Bool)

(assert (=> (not b_lambda!8851) (not b!415691)))

(declare-fun t!12253 () Bool)

(declare-fun tb!3179 () Bool)

(assert (=> (and start!39284 (= defaultEntry!557 defaultEntry!557) t!12253) tb!3179))

(declare-fun result!5893 () Bool)

(assert (=> tb!3179 (= result!5893 tp_is_empty!10717)))

(assert (=> b!415691 t!12253))

(declare-fun b_and!16981 () Bool)

(assert (= b_and!16979 (and (=> t!12253 result!5893) b_and!16981)))

(declare-fun m!404321 () Bool)

(assert (=> b!415693 m!404321))

(declare-fun m!404323 () Bool)

(assert (=> b!415700 m!404323))

(declare-fun m!404325 () Bool)

(assert (=> b!415700 m!404325))

(declare-fun m!404327 () Bool)

(assert (=> b!415691 m!404327))

(declare-fun m!404329 () Bool)

(assert (=> b!415691 m!404329))

(assert (=> b!415691 m!404327))

(declare-fun m!404331 () Bool)

(assert (=> b!415691 m!404331))

(declare-fun m!404333 () Bool)

(assert (=> b!415691 m!404333))

(declare-fun m!404335 () Bool)

(assert (=> b!415691 m!404335))

(declare-fun m!404337 () Bool)

(assert (=> b!415691 m!404337))

(declare-fun m!404339 () Bool)

(assert (=> b!415691 m!404339))

(assert (=> b!415691 m!404339))

(declare-fun m!404341 () Bool)

(assert (=> b!415691 m!404341))

(declare-fun m!404343 () Bool)

(assert (=> b!415691 m!404343))

(assert (=> b!415691 m!404343))

(declare-fun m!404345 () Bool)

(assert (=> b!415691 m!404345))

(declare-fun m!404347 () Bool)

(assert (=> b!415691 m!404347))

(declare-fun m!404349 () Bool)

(assert (=> b!415691 m!404349))

(declare-fun m!404351 () Bool)

(assert (=> b!415691 m!404351))

(declare-fun m!404353 () Bool)

(assert (=> b!415698 m!404353))

(declare-fun m!404355 () Bool)

(assert (=> bm!28846 m!404355))

(declare-fun m!404357 () Bool)

(assert (=> b!415685 m!404357))

(declare-fun m!404359 () Bool)

(assert (=> b!415696 m!404359))

(assert (=> b!415696 m!404359))

(declare-fun m!404361 () Bool)

(assert (=> b!415696 m!404361))

(declare-fun m!404363 () Bool)

(assert (=> b!415696 m!404363))

(declare-fun m!404365 () Bool)

(assert (=> mapNonEmpty!17697 m!404365))

(declare-fun m!404367 () Bool)

(assert (=> b!415699 m!404367))

(declare-fun m!404369 () Bool)

(assert (=> b!415692 m!404369))

(assert (=> b!415692 m!404335))

(declare-fun m!404371 () Bool)

(assert (=> b!415692 m!404371))

(declare-fun m!404373 () Bool)

(assert (=> start!39284 m!404373))

(declare-fun m!404375 () Bool)

(assert (=> start!39284 m!404375))

(declare-fun m!404377 () Bool)

(assert (=> b!415687 m!404377))

(declare-fun m!404379 () Bool)

(assert (=> bm!28845 m!404379))

(declare-fun m!404381 () Bool)

(assert (=> b!415689 m!404381))

(declare-fun m!404383 () Bool)

(assert (=> b!415695 m!404383))

(declare-fun m!404385 () Bool)

(assert (=> b!415684 m!404385))

(check-sat (not mapNonEmpty!17697) (not b!415692) (not b!415685) (not bm!28846) (not b!415687) (not b_lambda!8851) (not b!415696) (not b!415689) (not b!415693) (not b!415699) b_and!16981 (not b!415700) tp_is_empty!10717 (not b!415695) (not b!415691) (not b_next!9565) (not b!415684) (not start!39284) (not bm!28845))
(check-sat b_and!16981 (not b_next!9565))
