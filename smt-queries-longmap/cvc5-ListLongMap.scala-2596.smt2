; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39394 () Bool)

(assert start!39394)

(declare-fun b_free!9661 () Bool)

(declare-fun b_next!9661 () Bool)

(assert (=> start!39394 (= b_free!9661 (not b_next!9661))))

(declare-fun tp!34512 () Bool)

(declare-fun b_and!17197 () Bool)

(assert (=> start!39394 (= tp!34512 b_and!17197)))

(declare-fun b!418787 () Bool)

(declare-fun res!244064 () Bool)

(declare-fun e!249681 () Bool)

(assert (=> b!418787 (=> (not res!244064) (not e!249681))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!418787 (= res!244064 (validKeyInArray!0 k!794))))

(declare-fun b!418788 () Bool)

(declare-fun res!244066 () Bool)

(assert (=> b!418788 (=> (not res!244066) (not e!249681))))

(declare-datatypes ((array!25477 0))(
  ( (array!25478 (arr!12188 (Array (_ BitVec 32) (_ BitVec 64))) (size!12540 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25477)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!418788 (= res!244066 (or (= (select (arr!12188 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12188 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!418789 () Bool)

(declare-fun e!249677 () Bool)

(assert (=> b!418789 (= e!249681 e!249677)))

(declare-fun res!244077 () Bool)

(assert (=> b!418789 (=> (not res!244077) (not e!249677))))

(declare-fun lt!191984 () array!25477)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25477 (_ BitVec 32)) Bool)

(assert (=> b!418789 (= res!244077 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!191984 mask!1025))))

(assert (=> b!418789 (= lt!191984 (array!25478 (store (arr!12188 _keys!709) i!563 k!794) (size!12540 _keys!709)))))

(declare-fun b!418790 () Bool)

(declare-fun e!249679 () Bool)

(declare-fun tp_is_empty!10813 () Bool)

(assert (=> b!418790 (= e!249679 tp_is_empty!10813)))

(declare-fun res!244070 () Bool)

(assert (=> start!39394 (=> (not res!244070) (not e!249681))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39394 (= res!244070 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12540 _keys!709))))))

(assert (=> start!39394 e!249681))

(assert (=> start!39394 tp_is_empty!10813))

(assert (=> start!39394 tp!34512))

(assert (=> start!39394 true))

(declare-datatypes ((V!15523 0))(
  ( (V!15524 (val!5451 Int)) )
))
(declare-datatypes ((ValueCell!5063 0))(
  ( (ValueCellFull!5063 (v!7698 V!15523)) (EmptyCell!5063) )
))
(declare-datatypes ((array!25479 0))(
  ( (array!25480 (arr!12189 (Array (_ BitVec 32) ValueCell!5063)) (size!12541 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25479)

(declare-fun e!249680 () Bool)

(declare-fun array_inv!8886 (array!25479) Bool)

(assert (=> start!39394 (and (array_inv!8886 _values!549) e!249680)))

(declare-fun array_inv!8887 (array!25477) Bool)

(assert (=> start!39394 (array_inv!8887 _keys!709)))

(declare-fun minValue!515 () V!15523)

(declare-fun c!55205 () Bool)

(declare-datatypes ((tuple2!7130 0))(
  ( (tuple2!7131 (_1!3576 (_ BitVec 64)) (_2!3576 V!15523)) )
))
(declare-datatypes ((List!7143 0))(
  ( (Nil!7140) (Cons!7139 (h!7995 tuple2!7130) (t!12469 List!7143)) )
))
(declare-datatypes ((ListLongMap!6043 0))(
  ( (ListLongMap!6044 (toList!3037 List!7143)) )
))
(declare-fun call!29162 () ListLongMap!6043)

(declare-fun zeroValue!515 () V!15523)

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!191989 () array!25479)

(declare-fun bm!29158 () Bool)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1242 (array!25477 array!25479 (_ BitVec 32) (_ BitVec 32) V!15523 V!15523 (_ BitVec 32) Int) ListLongMap!6043)

(assert (=> bm!29158 (= call!29162 (getCurrentListMapNoExtraKeys!1242 (ite c!55205 lt!191984 _keys!709) (ite c!55205 lt!191989 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun call!29161 () ListLongMap!6043)

(declare-fun bm!29159 () Bool)

(assert (=> bm!29159 (= call!29161 (getCurrentListMapNoExtraKeys!1242 (ite c!55205 _keys!709 lt!191984) (ite c!55205 _values!549 lt!191989) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun e!249673 () Bool)

(declare-fun v!412 () V!15523)

(declare-fun b!418791 () Bool)

(declare-fun +!1236 (ListLongMap!6043 tuple2!7130) ListLongMap!6043)

(assert (=> b!418791 (= e!249673 (= call!29162 (+!1236 call!29161 (tuple2!7131 k!794 v!412))))))

(declare-fun b!418792 () Bool)

(declare-fun res!244074 () Bool)

(assert (=> b!418792 (=> (not res!244074) (not e!249681))))

(assert (=> b!418792 (= res!244074 (and (= (size!12541 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12540 _keys!709) (size!12541 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!418793 () Bool)

(declare-fun e!249676 () Bool)

(declare-fun e!249675 () Bool)

(assert (=> b!418793 (= e!249676 (not e!249675))))

(declare-fun res!244075 () Bool)

(assert (=> b!418793 (=> res!244075 e!249675)))

(assert (=> b!418793 (= res!244075 (validKeyInArray!0 (select (arr!12188 _keys!709) from!863)))))

(assert (=> b!418793 e!249673))

(assert (=> b!418793 (= c!55205 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12378 0))(
  ( (Unit!12379) )
))
(declare-fun lt!191990 () Unit!12378)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!440 (array!25477 array!25479 (_ BitVec 32) (_ BitVec 32) V!15523 V!15523 (_ BitVec 32) (_ BitVec 64) V!15523 (_ BitVec 32) Int) Unit!12378)

(assert (=> b!418793 (= lt!191990 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!440 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!418794 () Bool)

(assert (=> b!418794 (= e!249673 (= call!29161 call!29162))))

(declare-fun b!418795 () Bool)

(declare-fun e!249674 () Bool)

(assert (=> b!418795 (= e!249674 tp_is_empty!10813)))

(declare-fun b!418796 () Bool)

(declare-fun res!244073 () Bool)

(assert (=> b!418796 (=> (not res!244073) (not e!249677))))

(assert (=> b!418796 (= res!244073 (bvsle from!863 i!563))))

(declare-fun b!418797 () Bool)

(declare-fun res!244069 () Bool)

(assert (=> b!418797 (=> (not res!244069) (not e!249681))))

(assert (=> b!418797 (= res!244069 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!17841 () Bool)

(declare-fun mapRes!17841 () Bool)

(declare-fun tp!34511 () Bool)

(assert (=> mapNonEmpty!17841 (= mapRes!17841 (and tp!34511 e!249674))))

(declare-fun mapValue!17841 () ValueCell!5063)

(declare-fun mapRest!17841 () (Array (_ BitVec 32) ValueCell!5063))

(declare-fun mapKey!17841 () (_ BitVec 32))

(assert (=> mapNonEmpty!17841 (= (arr!12189 _values!549) (store mapRest!17841 mapKey!17841 mapValue!17841))))

(declare-fun b!418798 () Bool)

(assert (=> b!418798 (= e!249680 (and e!249679 mapRes!17841))))

(declare-fun condMapEmpty!17841 () Bool)

(declare-fun mapDefault!17841 () ValueCell!5063)

