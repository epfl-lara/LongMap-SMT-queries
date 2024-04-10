; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39400 () Bool)

(assert start!39400)

(declare-fun b_free!9667 () Bool)

(declare-fun b_next!9667 () Bool)

(assert (=> start!39400 (= b_free!9667 (not b_next!9667))))

(declare-fun tp!34529 () Bool)

(declare-fun b_and!17209 () Bool)

(assert (=> start!39400 (= tp!34529 b_and!17209)))

(declare-fun b!418964 () Bool)

(declare-fun e!249761 () Bool)

(declare-fun e!249756 () Bool)

(assert (=> b!418964 (= e!249761 e!249756)))

(declare-fun res!244203 () Bool)

(assert (=> b!418964 (=> (not res!244203) (not e!249756))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!418964 (= res!244203 (= from!863 i!563))))

(declare-datatypes ((V!15531 0))(
  ( (V!15532 (val!5454 Int)) )
))
(declare-fun minValue!515 () V!15531)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!7134 0))(
  ( (tuple2!7135 (_1!3578 (_ BitVec 64)) (_2!3578 V!15531)) )
))
(declare-datatypes ((List!7146 0))(
  ( (Nil!7143) (Cons!7142 (h!7998 tuple2!7134) (t!12478 List!7146)) )
))
(declare-datatypes ((ListLongMap!6047 0))(
  ( (ListLongMap!6048 (toList!3039 List!7146)) )
))
(declare-fun lt!192084 () ListLongMap!6047)

(declare-datatypes ((array!25487 0))(
  ( (array!25488 (arr!12193 (Array (_ BitVec 32) (_ BitVec 64))) (size!12545 (_ BitVec 32))) )
))
(declare-fun lt!192087 () array!25487)

(declare-fun zeroValue!515 () V!15531)

(declare-datatypes ((ValueCell!5066 0))(
  ( (ValueCellFull!5066 (v!7701 V!15531)) (EmptyCell!5066) )
))
(declare-datatypes ((array!25489 0))(
  ( (array!25490 (arr!12194 (Array (_ BitVec 32) ValueCell!5066)) (size!12546 (_ BitVec 32))) )
))
(declare-fun lt!192080 () array!25489)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1244 (array!25487 array!25489 (_ BitVec 32) (_ BitVec 32) V!15531 V!15531 (_ BitVec 32) Int) ListLongMap!6047)

(assert (=> b!418964 (= lt!192084 (getCurrentListMapNoExtraKeys!1244 lt!192087 lt!192080 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!25489)

(declare-fun v!412 () V!15531)

(assert (=> b!418964 (= lt!192080 (array!25490 (store (arr!12194 _values!549) i!563 (ValueCellFull!5066 v!412)) (size!12546 _values!549)))))

(declare-fun _keys!709 () array!25487)

(declare-fun lt!192088 () ListLongMap!6047)

(assert (=> b!418964 (= lt!192088 (getCurrentListMapNoExtraKeys!1244 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun c!55214 () Bool)

(declare-fun call!29179 () ListLongMap!6047)

(declare-fun bm!29176 () Bool)

(assert (=> bm!29176 (= call!29179 (getCurrentListMapNoExtraKeys!1244 (ite c!55214 _keys!709 lt!192087) (ite c!55214 _values!549 lt!192080) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!418965 () Bool)

(declare-fun res!244191 () Bool)

(declare-fun e!249760 () Bool)

(assert (=> b!418965 (=> (not res!244191) (not e!249760))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!418965 (= res!244191 (validMask!0 mask!1025))))

(declare-fun b!418966 () Bool)

(declare-fun res!244201 () Bool)

(assert (=> b!418966 (=> (not res!244201) (not e!249760))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25487 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!418966 (= res!244201 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!17850 () Bool)

(declare-fun mapRes!17850 () Bool)

(declare-fun tp!34530 () Bool)

(declare-fun e!249757 () Bool)

(assert (=> mapNonEmpty!17850 (= mapRes!17850 (and tp!34530 e!249757))))

(declare-fun mapRest!17850 () (Array (_ BitVec 32) ValueCell!5066))

(declare-fun mapValue!17850 () ValueCell!5066)

(declare-fun mapKey!17850 () (_ BitVec 32))

(assert (=> mapNonEmpty!17850 (= (arr!12194 _values!549) (store mapRest!17850 mapKey!17850 mapValue!17850))))

(declare-fun b!418967 () Bool)

(declare-fun res!244202 () Bool)

(assert (=> b!418967 (=> (not res!244202) (not e!249760))))

(assert (=> b!418967 (= res!244202 (or (= (select (arr!12193 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12193 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!244193 () Bool)

(assert (=> start!39400 (=> (not res!244193) (not e!249760))))

(assert (=> start!39400 (= res!244193 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12545 _keys!709))))))

(assert (=> start!39400 e!249760))

(declare-fun tp_is_empty!10819 () Bool)

(assert (=> start!39400 tp_is_empty!10819))

(assert (=> start!39400 tp!34529))

(assert (=> start!39400 true))

(declare-fun e!249754 () Bool)

(declare-fun array_inv!8890 (array!25489) Bool)

(assert (=> start!39400 (and (array_inv!8890 _values!549) e!249754)))

(declare-fun array_inv!8891 (array!25487) Bool)

(assert (=> start!39400 (array_inv!8891 _keys!709)))

(declare-fun b!418968 () Bool)

(declare-fun e!249762 () Bool)

(assert (=> b!418968 (= e!249754 (and e!249762 mapRes!17850))))

(declare-fun condMapEmpty!17850 () Bool)

(declare-fun mapDefault!17850 () ValueCell!5066)

