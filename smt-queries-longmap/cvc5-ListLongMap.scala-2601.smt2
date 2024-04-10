; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39424 () Bool)

(assert start!39424)

(declare-fun b_free!9691 () Bool)

(declare-fun b_next!9691 () Bool)

(assert (=> start!39424 (= b_free!9691 (not b_next!9691))))

(declare-fun tp!34601 () Bool)

(declare-fun b_and!17257 () Bool)

(assert (=> start!39424 (= tp!34601 b_and!17257)))

(declare-fun b!419672 () Bool)

(declare-fun e!250084 () Bool)

(declare-fun e!250083 () Bool)

(assert (=> b!419672 (= e!250084 e!250083)))

(declare-fun res!244701 () Bool)

(assert (=> b!419672 (=> (not res!244701) (not e!250083))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!419672 (= res!244701 (= from!863 i!563))))

(declare-datatypes ((V!15563 0))(
  ( (V!15564 (val!5466 Int)) )
))
(declare-fun minValue!515 () V!15563)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!7156 0))(
  ( (tuple2!7157 (_1!3589 (_ BitVec 64)) (_2!3589 V!15563)) )
))
(declare-datatypes ((List!7165 0))(
  ( (Nil!7162) (Cons!7161 (h!8017 tuple2!7156) (t!12521 List!7165)) )
))
(declare-datatypes ((ListLongMap!6069 0))(
  ( (ListLongMap!6070 (toList!3050 List!7165)) )
))
(declare-fun lt!192485 () ListLongMap!6069)

(declare-fun zeroValue!515 () V!15563)

(declare-datatypes ((array!25535 0))(
  ( (array!25536 (arr!12217 (Array (_ BitVec 32) (_ BitVec 64))) (size!12569 (_ BitVec 32))) )
))
(declare-fun lt!192484 () array!25535)

(declare-datatypes ((ValueCell!5078 0))(
  ( (ValueCellFull!5078 (v!7713 V!15563)) (EmptyCell!5078) )
))
(declare-datatypes ((array!25537 0))(
  ( (array!25538 (arr!12218 (Array (_ BitVec 32) ValueCell!5078)) (size!12570 (_ BitVec 32))) )
))
(declare-fun lt!192475 () array!25537)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1255 (array!25535 array!25537 (_ BitVec 32) (_ BitVec 32) V!15563 V!15563 (_ BitVec 32) Int) ListLongMap!6069)

(assert (=> b!419672 (= lt!192485 (getCurrentListMapNoExtraKeys!1255 lt!192484 lt!192475 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!25537)

(declare-fun v!412 () V!15563)

(assert (=> b!419672 (= lt!192475 (array!25538 (store (arr!12218 _values!549) i!563 (ValueCellFull!5078 v!412)) (size!12570 _values!549)))))

(declare-fun lt!192476 () ListLongMap!6069)

(declare-fun _keys!709 () array!25535)

(assert (=> b!419672 (= lt!192476 (getCurrentListMapNoExtraKeys!1255 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!419673 () Bool)

(declare-fun res!244694 () Bool)

(declare-fun e!250085 () Bool)

(assert (=> b!419673 (=> (not res!244694) (not e!250085))))

(assert (=> b!419673 (= res!244694 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12569 _keys!709))))))

(declare-fun b!419674 () Bool)

(declare-fun e!250086 () Bool)

(declare-fun tp_is_empty!10843 () Bool)

(assert (=> b!419674 (= e!250086 tp_is_empty!10843)))

(declare-fun b!419675 () Bool)

(declare-fun res!244703 () Bool)

(assert (=> b!419675 (=> (not res!244703) (not e!250085))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!419675 (= res!244703 (validMask!0 mask!1025))))

(declare-fun call!29251 () ListLongMap!6069)

(declare-fun call!29252 () ListLongMap!6069)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun b!419676 () Bool)

(declare-fun e!250082 () Bool)

(declare-fun +!1247 (ListLongMap!6069 tuple2!7156) ListLongMap!6069)

(assert (=> b!419676 (= e!250082 (= call!29252 (+!1247 call!29251 (tuple2!7157 k!794 v!412))))))

(declare-fun b!419677 () Bool)

(declare-fun e!250079 () Bool)

(declare-fun e!250078 () Bool)

(declare-fun mapRes!17886 () Bool)

(assert (=> b!419677 (= e!250079 (and e!250078 mapRes!17886))))

(declare-fun condMapEmpty!17886 () Bool)

(declare-fun mapDefault!17886 () ValueCell!5078)

