; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39376 () Bool)

(assert start!39376)

(declare-fun b_free!9643 () Bool)

(declare-fun b_next!9643 () Bool)

(assert (=> start!39376 (= b_free!9643 (not b_next!9643))))

(declare-fun tp!34457 () Bool)

(declare-fun b_and!17161 () Bool)

(assert (=> start!39376 (= tp!34457 b_and!17161)))

(declare-fun b!418256 () Bool)

(declare-fun res!243694 () Bool)

(declare-fun e!249437 () Bool)

(assert (=> b!418256 (=> (not res!243694) (not e!249437))))

(declare-datatypes ((array!25441 0))(
  ( (array!25442 (arr!12170 (Array (_ BitVec 32) (_ BitVec 64))) (size!12522 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25441)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!418256 (= res!243694 (or (= (select (arr!12170 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12170 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!418257 () Bool)

(declare-fun res!243691 () Bool)

(assert (=> b!418257 (=> (not res!243691) (not e!249437))))

(assert (=> b!418257 (= res!243691 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12522 _keys!709))))))

(declare-fun b!418258 () Bool)

(declare-fun e!249435 () Bool)

(declare-fun tp_is_empty!10795 () Bool)

(assert (=> b!418258 (= e!249435 tp_is_empty!10795)))

(declare-fun b!418259 () Bool)

(declare-fun e!249436 () Bool)

(assert (=> b!418259 (= e!249436 tp_is_empty!10795)))

(declare-fun b!418260 () Bool)

(declare-fun res!243689 () Bool)

(assert (=> b!418260 (=> (not res!243689) (not e!249437))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!418260 (= res!243689 (validKeyInArray!0 k!794))))

(declare-fun mapNonEmpty!17814 () Bool)

(declare-fun mapRes!17814 () Bool)

(declare-fun tp!34458 () Bool)

(assert (=> mapNonEmpty!17814 (= mapRes!17814 (and tp!34458 e!249436))))

(declare-datatypes ((V!15499 0))(
  ( (V!15500 (val!5442 Int)) )
))
(declare-datatypes ((ValueCell!5054 0))(
  ( (ValueCellFull!5054 (v!7689 V!15499)) (EmptyCell!5054) )
))
(declare-fun mapRest!17814 () (Array (_ BitVec 32) ValueCell!5054))

(declare-fun mapValue!17814 () ValueCell!5054)

(declare-datatypes ((array!25443 0))(
  ( (array!25444 (arr!12171 (Array (_ BitVec 32) ValueCell!5054)) (size!12523 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25443)

(declare-fun mapKey!17814 () (_ BitVec 32))

(assert (=> mapNonEmpty!17814 (= (arr!12171 _values!549) (store mapRest!17814 mapKey!17814 mapValue!17814))))

(declare-fun b!418261 () Bool)

(declare-fun e!249430 () Bool)

(assert (=> b!418261 (= e!249430 true)))

(declare-datatypes ((tuple2!7114 0))(
  ( (tuple2!7115 (_1!3568 (_ BitVec 64)) (_2!3568 V!15499)) )
))
(declare-fun lt!191688 () tuple2!7114)

(declare-fun lt!191683 () V!15499)

(declare-datatypes ((List!7127 0))(
  ( (Nil!7124) (Cons!7123 (h!7979 tuple2!7114) (t!12435 List!7127)) )
))
(declare-datatypes ((ListLongMap!6027 0))(
  ( (ListLongMap!6028 (toList!3029 List!7127)) )
))
(declare-fun lt!191689 () ListLongMap!6027)

(declare-fun +!1229 (ListLongMap!6027 tuple2!7114) ListLongMap!6027)

(assert (=> b!418261 (= (+!1229 lt!191689 lt!191688) (+!1229 (+!1229 lt!191689 (tuple2!7115 k!794 lt!191683)) lt!191688))))

(declare-fun lt!191686 () V!15499)

(assert (=> b!418261 (= lt!191688 (tuple2!7115 k!794 lt!191686))))

(declare-datatypes ((Unit!12362 0))(
  ( (Unit!12363) )
))
(declare-fun lt!191684 () Unit!12362)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!29 (ListLongMap!6027 (_ BitVec 64) V!15499 V!15499) Unit!12362)

(assert (=> b!418261 (= lt!191684 (addSameAsAddTwiceSameKeyDiffValues!29 lt!191689 k!794 lt!191683 lt!191686))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lt!191692 () V!15499)

(declare-fun get!6029 (ValueCell!5054 V!15499) V!15499)

(assert (=> b!418261 (= lt!191683 (get!6029 (select (arr!12171 _values!549) from!863) lt!191692))))

(declare-fun lt!191690 () ListLongMap!6027)

(declare-fun lt!191685 () array!25441)

(assert (=> b!418261 (= lt!191690 (+!1229 lt!191689 (tuple2!7115 (select (arr!12170 lt!191685) from!863) lt!191686)))))

(declare-fun v!412 () V!15499)

(assert (=> b!418261 (= lt!191686 (get!6029 (select (store (arr!12171 _values!549) i!563 (ValueCellFull!5054 v!412)) from!863) lt!191692))))

(declare-fun defaultEntry!557 () Int)

(declare-fun dynLambda!700 (Int (_ BitVec 64)) V!15499)

(assert (=> b!418261 (= lt!191692 (dynLambda!700 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15499)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun minValue!515 () V!15499)

(declare-fun lt!191691 () array!25443)

(declare-fun getCurrentListMapNoExtraKeys!1234 (array!25441 array!25443 (_ BitVec 32) (_ BitVec 32) V!15499 V!15499 (_ BitVec 32) Int) ListLongMap!6027)

(assert (=> b!418261 (= lt!191689 (getCurrentListMapNoExtraKeys!1234 lt!191685 lt!191691 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun call!29108 () ListLongMap!6027)

(declare-fun e!249434 () Bool)

(declare-fun call!29107 () ListLongMap!6027)

(declare-fun b!418262 () Bool)

(assert (=> b!418262 (= e!249434 (= call!29108 (+!1229 call!29107 (tuple2!7115 k!794 v!412))))))

(declare-fun b!418263 () Bool)

(declare-fun res!243688 () Bool)

(assert (=> b!418263 (=> (not res!243688) (not e!249437))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25441 (_ BitVec 32)) Bool)

(assert (=> b!418263 (= res!243688 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!418264 () Bool)

(assert (=> b!418264 (= e!249434 (= call!29107 call!29108))))

(declare-fun mapIsEmpty!17814 () Bool)

(assert (=> mapIsEmpty!17814 mapRes!17814))

(declare-fun b!418265 () Bool)

(declare-fun e!249432 () Bool)

(declare-fun e!249438 () Bool)

(assert (=> b!418265 (= e!249432 e!249438)))

(declare-fun res!243690 () Bool)

(assert (=> b!418265 (=> (not res!243690) (not e!249438))))

(assert (=> b!418265 (= res!243690 (= from!863 i!563))))

(assert (=> b!418265 (= lt!191690 (getCurrentListMapNoExtraKeys!1234 lt!191685 lt!191691 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!418265 (= lt!191691 (array!25444 (store (arr!12171 _values!549) i!563 (ValueCellFull!5054 v!412)) (size!12523 _values!549)))))

(declare-fun lt!191693 () ListLongMap!6027)

(assert (=> b!418265 (= lt!191693 (getCurrentListMapNoExtraKeys!1234 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!418266 () Bool)

(declare-fun res!243697 () Bool)

(assert (=> b!418266 (=> (not res!243697) (not e!249437))))

(declare-fun arrayContainsKey!0 (array!25441 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!418266 (= res!243697 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun bm!29104 () Bool)

(declare-fun c!55178 () Bool)

(assert (=> bm!29104 (= call!29108 (getCurrentListMapNoExtraKeys!1234 (ite c!55178 lt!191685 _keys!709) (ite c!55178 lt!191691 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!243692 () Bool)

(assert (=> start!39376 (=> (not res!243692) (not e!249437))))

(assert (=> start!39376 (= res!243692 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12522 _keys!709))))))

(assert (=> start!39376 e!249437))

(assert (=> start!39376 tp_is_empty!10795))

(assert (=> start!39376 tp!34457))

(assert (=> start!39376 true))

(declare-fun e!249433 () Bool)

(declare-fun array_inv!8870 (array!25443) Bool)

(assert (=> start!39376 (and (array_inv!8870 _values!549) e!249433)))

(declare-fun array_inv!8871 (array!25441) Bool)

(assert (=> start!39376 (array_inv!8871 _keys!709)))

(declare-fun b!418267 () Bool)

(declare-fun res!243693 () Bool)

(assert (=> b!418267 (=> (not res!243693) (not e!249432))))

(declare-datatypes ((List!7128 0))(
  ( (Nil!7125) (Cons!7124 (h!7980 (_ BitVec 64)) (t!12436 List!7128)) )
))
(declare-fun arrayNoDuplicates!0 (array!25441 (_ BitVec 32) List!7128) Bool)

(assert (=> b!418267 (= res!243693 (arrayNoDuplicates!0 lt!191685 #b00000000000000000000000000000000 Nil!7125))))

(declare-fun b!418268 () Bool)

(declare-fun res!243686 () Bool)

(assert (=> b!418268 (=> (not res!243686) (not e!249437))))

(assert (=> b!418268 (= res!243686 (and (= (size!12523 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12522 _keys!709) (size!12523 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun bm!29105 () Bool)

(assert (=> bm!29105 (= call!29107 (getCurrentListMapNoExtraKeys!1234 (ite c!55178 _keys!709 lt!191685) (ite c!55178 _values!549 lt!191691) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!418269 () Bool)

(declare-fun res!243687 () Bool)

(assert (=> b!418269 (=> (not res!243687) (not e!249437))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!418269 (= res!243687 (validMask!0 mask!1025))))

(declare-fun b!418270 () Bool)

(assert (=> b!418270 (= e!249437 e!249432)))

(declare-fun res!243696 () Bool)

(assert (=> b!418270 (=> (not res!243696) (not e!249432))))

(assert (=> b!418270 (= res!243696 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!191685 mask!1025))))

(assert (=> b!418270 (= lt!191685 (array!25442 (store (arr!12170 _keys!709) i!563 k!794) (size!12522 _keys!709)))))

(declare-fun b!418271 () Bool)

(declare-fun res!243695 () Bool)

(assert (=> b!418271 (=> (not res!243695) (not e!249432))))

(assert (=> b!418271 (= res!243695 (bvsle from!863 i!563))))

(declare-fun b!418272 () Bool)

(assert (=> b!418272 (= e!249438 (not e!249430))))

(declare-fun res!243698 () Bool)

(assert (=> b!418272 (=> res!243698 e!249430)))

(assert (=> b!418272 (= res!243698 (validKeyInArray!0 (select (arr!12170 _keys!709) from!863)))))

(assert (=> b!418272 e!249434))

(assert (=> b!418272 (= c!55178 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun lt!191687 () Unit!12362)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!433 (array!25441 array!25443 (_ BitVec 32) (_ BitVec 32) V!15499 V!15499 (_ BitVec 32) (_ BitVec 64) V!15499 (_ BitVec 32) Int) Unit!12362)

(assert (=> b!418272 (= lt!191687 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!433 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!418273 () Bool)

(assert (=> b!418273 (= e!249433 (and e!249435 mapRes!17814))))

(declare-fun condMapEmpty!17814 () Bool)

(declare-fun mapDefault!17814 () ValueCell!5054)

