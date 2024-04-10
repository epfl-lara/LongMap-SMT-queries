; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39632 () Bool)

(assert start!39632)

(declare-fun b_free!9899 () Bool)

(declare-fun b_next!9899 () Bool)

(assert (=> start!39632 (= b_free!9899 (not b_next!9899))))

(declare-fun tp!35225 () Bool)

(declare-fun b_and!17555 () Bool)

(assert (=> start!39632 (= tp!35225 b_and!17555)))

(declare-fun b!424991 () Bool)

(declare-fun e!252372 () Bool)

(declare-fun e!252367 () Bool)

(assert (=> b!424991 (= e!252372 e!252367)))

(declare-fun res!248733 () Bool)

(assert (=> b!424991 (=> (not res!248733) (not e!252367))))

(declare-datatypes ((array!25941 0))(
  ( (array!25942 (arr!12420 (Array (_ BitVec 32) (_ BitVec 64))) (size!12772 (_ BitVec 32))) )
))
(declare-fun lt!194511 () array!25941)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25941 (_ BitVec 32)) Bool)

(assert (=> b!424991 (= res!248733 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194511 mask!1025))))

(declare-fun _keys!709 () array!25941)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!424991 (= lt!194511 (array!25942 (store (arr!12420 _keys!709) i!563 k!794) (size!12772 _keys!709)))))

(declare-fun res!248727 () Bool)

(assert (=> start!39632 (=> (not res!248727) (not e!252372))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39632 (= res!248727 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12772 _keys!709))))))

(assert (=> start!39632 e!252372))

(declare-fun tp_is_empty!11051 () Bool)

(assert (=> start!39632 tp_is_empty!11051))

(assert (=> start!39632 tp!35225))

(assert (=> start!39632 true))

(declare-datatypes ((V!15839 0))(
  ( (V!15840 (val!5570 Int)) )
))
(declare-datatypes ((ValueCell!5182 0))(
  ( (ValueCellFull!5182 (v!7817 V!15839)) (EmptyCell!5182) )
))
(declare-datatypes ((array!25943 0))(
  ( (array!25944 (arr!12421 (Array (_ BitVec 32) ValueCell!5182)) (size!12773 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25943)

(declare-fun e!252368 () Bool)

(declare-fun array_inv!9050 (array!25943) Bool)

(assert (=> start!39632 (and (array_inv!9050 _values!549) e!252368)))

(declare-fun array_inv!9051 (array!25941) Bool)

(assert (=> start!39632 (array_inv!9051 _keys!709)))

(declare-fun b!424992 () Bool)

(declare-fun res!248726 () Bool)

(assert (=> b!424992 (=> (not res!248726) (not e!252372))))

(declare-datatypes ((List!7326 0))(
  ( (Nil!7323) (Cons!7322 (h!8178 (_ BitVec 64)) (t!12770 List!7326)) )
))
(declare-fun arrayNoDuplicates!0 (array!25941 (_ BitVec 32) List!7326) Bool)

(assert (=> b!424992 (= res!248726 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7323))))

(declare-fun b!424993 () Bool)

(declare-fun e!252370 () Bool)

(assert (=> b!424993 (= e!252367 e!252370)))

(declare-fun res!248721 () Bool)

(assert (=> b!424993 (=> (not res!248721) (not e!252370))))

(assert (=> b!424993 (= res!248721 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((tuple2!7316 0))(
  ( (tuple2!7317 (_1!3669 (_ BitVec 64)) (_2!3669 V!15839)) )
))
(declare-datatypes ((List!7327 0))(
  ( (Nil!7324) (Cons!7323 (h!8179 tuple2!7316) (t!12771 List!7327)) )
))
(declare-datatypes ((ListLongMap!6229 0))(
  ( (ListLongMap!6230 (toList!3130 List!7327)) )
))
(declare-fun lt!194509 () ListLongMap!6229)

(declare-fun minValue!515 () V!15839)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15839)

(declare-fun lt!194513 () array!25943)

(declare-fun getCurrentListMapNoExtraKeys!1334 (array!25941 array!25943 (_ BitVec 32) (_ BitVec 32) V!15839 V!15839 (_ BitVec 32) Int) ListLongMap!6229)

(assert (=> b!424993 (= lt!194509 (getCurrentListMapNoExtraKeys!1334 lt!194511 lt!194513 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!15839)

(assert (=> b!424993 (= lt!194513 (array!25944 (store (arr!12421 _values!549) i!563 (ValueCellFull!5182 v!412)) (size!12773 _values!549)))))

(declare-fun lt!194510 () ListLongMap!6229)

(assert (=> b!424993 (= lt!194510 (getCurrentListMapNoExtraKeys!1334 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapNonEmpty!18198 () Bool)

(declare-fun mapRes!18198 () Bool)

(declare-fun tp!35226 () Bool)

(declare-fun e!252369 () Bool)

(assert (=> mapNonEmpty!18198 (= mapRes!18198 (and tp!35226 e!252369))))

(declare-fun mapKey!18198 () (_ BitVec 32))

(declare-fun mapValue!18198 () ValueCell!5182)

(declare-fun mapRest!18198 () (Array (_ BitVec 32) ValueCell!5182))

(assert (=> mapNonEmpty!18198 (= (arr!12421 _values!549) (store mapRest!18198 mapKey!18198 mapValue!18198))))

(declare-fun b!424994 () Bool)

(declare-fun res!248732 () Bool)

(assert (=> b!424994 (=> (not res!248732) (not e!252372))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!424994 (= res!248732 (validMask!0 mask!1025))))

(declare-fun b!424995 () Bool)

(declare-fun res!248730 () Bool)

(assert (=> b!424995 (=> (not res!248730) (not e!252372))))

(assert (=> b!424995 (= res!248730 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!424996 () Bool)

(declare-fun e!252366 () Bool)

(assert (=> b!424996 (= e!252366 tp_is_empty!11051)))

(declare-fun b!424997 () Bool)

(assert (=> b!424997 (= e!252370 (not true))))

(declare-fun +!1288 (ListLongMap!6229 tuple2!7316) ListLongMap!6229)

(assert (=> b!424997 (= (getCurrentListMapNoExtraKeys!1334 lt!194511 lt!194513 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1288 (getCurrentListMapNoExtraKeys!1334 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7317 k!794 v!412)))))

(declare-datatypes ((Unit!12478 0))(
  ( (Unit!12479) )
))
(declare-fun lt!194512 () Unit!12478)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!483 (array!25941 array!25943 (_ BitVec 32) (_ BitVec 32) V!15839 V!15839 (_ BitVec 32) (_ BitVec 64) V!15839 (_ BitVec 32) Int) Unit!12478)

(assert (=> b!424997 (= lt!194512 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!483 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!424998 () Bool)

(declare-fun res!248731 () Bool)

(assert (=> b!424998 (=> (not res!248731) (not e!252372))))

(declare-fun arrayContainsKey!0 (array!25941 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!424998 (= res!248731 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!424999 () Bool)

(assert (=> b!424999 (= e!252369 tp_is_empty!11051)))

(declare-fun b!425000 () Bool)

(declare-fun res!248724 () Bool)

(assert (=> b!425000 (=> (not res!248724) (not e!252372))))

(assert (=> b!425000 (= res!248724 (or (= (select (arr!12420 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12420 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!425001 () Bool)

(assert (=> b!425001 (= e!252368 (and e!252366 mapRes!18198))))

(declare-fun condMapEmpty!18198 () Bool)

(declare-fun mapDefault!18198 () ValueCell!5182)

