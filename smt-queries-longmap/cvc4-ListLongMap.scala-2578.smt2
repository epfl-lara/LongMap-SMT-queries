; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39290 () Bool)

(assert start!39290)

(declare-fun b_free!9557 () Bool)

(declare-fun b_next!9557 () Bool)

(assert (=> start!39290 (= b_free!9557 (not b_next!9557))))

(declare-fun tp!34199 () Bool)

(declare-fun b_and!16989 () Bool)

(assert (=> start!39290 (= tp!34199 b_and!16989)))

(declare-fun b!415719 () Bool)

(declare-fun res!241887 () Bool)

(declare-fun e!248271 () Bool)

(assert (=> b!415719 (=> (not res!241887) (not e!248271))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!25275 0))(
  ( (array!25276 (arr!12087 (Array (_ BitVec 32) (_ BitVec 64))) (size!12439 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25275)

(assert (=> b!415719 (= res!241887 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12439 _keys!709))))))

(declare-fun b!415720 () Bool)

(declare-fun res!241880 () Bool)

(assert (=> b!415720 (=> (not res!241880) (not e!248271))))

(assert (=> b!415720 (= res!241880 (or (= (select (arr!12087 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12087 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!415721 () Bool)

(declare-fun res!241893 () Bool)

(assert (=> b!415721 (=> (not res!241893) (not e!248271))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!415721 (= res!241893 (validMask!0 mask!1025))))

(declare-fun b!415722 () Bool)

(declare-fun e!248277 () Bool)

(declare-fun e!248273 () Bool)

(assert (=> b!415722 (= e!248277 (not e!248273))))

(declare-fun res!241883 () Bool)

(assert (=> b!415722 (=> res!241883 e!248273)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!415722 (= res!241883 (validKeyInArray!0 (select (arr!12087 _keys!709) from!863)))))

(declare-fun e!248275 () Bool)

(assert (=> b!415722 e!248275))

(declare-fun c!55049 () Bool)

(assert (=> b!415722 (= c!55049 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((V!15383 0))(
  ( (V!15384 (val!5399 Int)) )
))
(declare-fun minValue!515 () V!15383)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15383)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun v!412 () V!15383)

(declare-datatypes ((Unit!12290 0))(
  ( (Unit!12291) )
))
(declare-fun lt!190325 () Unit!12290)

(declare-datatypes ((ValueCell!5011 0))(
  ( (ValueCellFull!5011 (v!7646 V!15383)) (EmptyCell!5011) )
))
(declare-datatypes ((array!25277 0))(
  ( (array!25278 (arr!12088 (Array (_ BitVec 32) ValueCell!5011)) (size!12440 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25277)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!403 (array!25275 array!25277 (_ BitVec 32) (_ BitVec 32) V!15383 V!15383 (_ BitVec 32) (_ BitVec 64) V!15383 (_ BitVec 32) Int) Unit!12290)

(assert (=> b!415722 (= lt!190325 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!403 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!415723 () Bool)

(declare-fun res!241890 () Bool)

(assert (=> b!415723 (=> (not res!241890) (not e!248271))))

(assert (=> b!415723 (= res!241890 (validKeyInArray!0 k!794))))

(declare-fun b!415724 () Bool)

(declare-fun e!248274 () Bool)

(assert (=> b!415724 (= e!248271 e!248274)))

(declare-fun res!241886 () Bool)

(assert (=> b!415724 (=> (not res!241886) (not e!248274))))

(declare-fun lt!190327 () array!25275)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25275 (_ BitVec 32)) Bool)

(assert (=> b!415724 (= res!241886 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!190327 mask!1025))))

(assert (=> b!415724 (= lt!190327 (array!25276 (store (arr!12087 _keys!709) i!563 k!794) (size!12439 _keys!709)))))

(declare-fun lt!190326 () array!25277)

(declare-datatypes ((tuple2!7034 0))(
  ( (tuple2!7035 (_1!3528 (_ BitVec 64)) (_2!3528 V!15383)) )
))
(declare-datatypes ((List!7055 0))(
  ( (Nil!7052) (Cons!7051 (h!7907 tuple2!7034) (t!12277 List!7055)) )
))
(declare-datatypes ((ListLongMap!5947 0))(
  ( (ListLongMap!5948 (toList!2989 List!7055)) )
))
(declare-fun call!28850 () ListLongMap!5947)

(declare-fun bm!28846 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1195 (array!25275 array!25277 (_ BitVec 32) (_ BitVec 32) V!15383 V!15383 (_ BitVec 32) Int) ListLongMap!5947)

(assert (=> bm!28846 (= call!28850 (getCurrentListMapNoExtraKeys!1195 (ite c!55049 _keys!709 lt!190327) (ite c!55049 _values!549 lt!190326) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!415725 () Bool)

(declare-fun res!241881 () Bool)

(assert (=> b!415725 (=> (not res!241881) (not e!248271))))

(assert (=> b!415725 (= res!241881 (and (= (size!12440 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12439 _keys!709) (size!12440 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun res!241884 () Bool)

(assert (=> start!39290 (=> (not res!241884) (not e!248271))))

(assert (=> start!39290 (= res!241884 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12439 _keys!709))))))

(assert (=> start!39290 e!248271))

(declare-fun tp_is_empty!10709 () Bool)

(assert (=> start!39290 tp_is_empty!10709))

(assert (=> start!39290 tp!34199))

(assert (=> start!39290 true))

(declare-fun e!248272 () Bool)

(declare-fun array_inv!8816 (array!25277) Bool)

(assert (=> start!39290 (and (array_inv!8816 _values!549) e!248272)))

(declare-fun array_inv!8817 (array!25275) Bool)

(assert (=> start!39290 (array_inv!8817 _keys!709)))

(declare-fun b!415726 () Bool)

(declare-fun res!241885 () Bool)

(assert (=> b!415726 (=> (not res!241885) (not e!248271))))

(declare-fun arrayContainsKey!0 (array!25275 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!415726 (= res!241885 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!415727 () Bool)

(declare-fun e!248276 () Bool)

(assert (=> b!415727 (= e!248276 tp_is_empty!10709)))

(declare-fun b!415728 () Bool)

(declare-fun res!241882 () Bool)

(assert (=> b!415728 (=> (not res!241882) (not e!248271))))

(declare-datatypes ((List!7056 0))(
  ( (Nil!7053) (Cons!7052 (h!7908 (_ BitVec 64)) (t!12278 List!7056)) )
))
(declare-fun arrayNoDuplicates!0 (array!25275 (_ BitVec 32) List!7056) Bool)

(assert (=> b!415728 (= res!241882 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7053))))

(declare-fun b!415729 () Bool)

(declare-fun e!248269 () Bool)

(assert (=> b!415729 (= e!248269 tp_is_empty!10709)))

(declare-fun b!415730 () Bool)

(declare-fun res!241891 () Bool)

(assert (=> b!415730 (=> (not res!241891) (not e!248271))))

(assert (=> b!415730 (= res!241891 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!415731 () Bool)

(declare-fun mapRes!17685 () Bool)

(assert (=> b!415731 (= e!248272 (and e!248269 mapRes!17685))))

(declare-fun condMapEmpty!17685 () Bool)

(declare-fun mapDefault!17685 () ValueCell!5011)

