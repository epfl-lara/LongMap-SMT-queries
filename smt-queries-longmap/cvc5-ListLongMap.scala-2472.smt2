; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38650 () Bool)

(assert start!38650)

(declare-fun b_free!9187 () Bool)

(declare-fun b_next!9187 () Bool)

(assert (=> start!38650 (= b_free!9187 (not b_next!9187))))

(declare-fun tp!32684 () Bool)

(declare-fun b_and!16573 () Bool)

(assert (=> start!38650 (= tp!32684 b_and!16573)))

(declare-fun b!401227 () Bool)

(declare-fun res!230946 () Bool)

(declare-fun e!241968 () Bool)

(assert (=> b!401227 (=> (not res!230946) (not e!241968))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!24045 0))(
  ( (array!24046 (arr!11472 (Array (_ BitVec 32) (_ BitVec 64))) (size!11824 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24045)

(assert (=> b!401227 (= res!230946 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11824 _keys!709))))))

(declare-fun b!401228 () Bool)

(declare-fun res!230942 () Bool)

(declare-fun e!241969 () Bool)

(assert (=> b!401228 (=> (not res!230942) (not e!241969))))

(declare-fun lt!187786 () array!24045)

(declare-datatypes ((List!6661 0))(
  ( (Nil!6658) (Cons!6657 (h!7513 (_ BitVec 64)) (t!11835 List!6661)) )
))
(declare-fun arrayNoDuplicates!0 (array!24045 (_ BitVec 32) List!6661) Bool)

(assert (=> b!401228 (= res!230942 (arrayNoDuplicates!0 lt!187786 #b00000000000000000000000000000000 Nil!6658))))

(declare-fun b!401229 () Bool)

(assert (=> b!401229 (= e!241969 (not true))))

(declare-fun e!241970 () Bool)

(assert (=> b!401229 e!241970))

(declare-fun c!54737 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!401229 (= c!54737 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((V!14531 0))(
  ( (V!14532 (val!5079 Int)) )
))
(declare-fun minValue!515 () V!14531)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4691 0))(
  ( (ValueCellFull!4691 (v!7326 V!14531)) (EmptyCell!4691) )
))
(declare-datatypes ((array!24047 0))(
  ( (array!24048 (arr!11473 (Array (_ BitVec 32) ValueCell!4691)) (size!11825 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24047)

(declare-fun zeroValue!515 () V!14531)

(declare-fun k!794 () (_ BitVec 64))

(declare-datatypes ((Unit!12152 0))(
  ( (Unit!12153) )
))
(declare-fun lt!187787 () Unit!12152)

(declare-fun v!412 () V!14531)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!334 (array!24045 array!24047 (_ BitVec 32) (_ BitVec 32) V!14531 V!14531 (_ BitVec 32) (_ BitVec 64) V!14531 (_ BitVec 32) Int) Unit!12152)

(assert (=> b!401229 (= lt!187787 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!334 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!401230 () Bool)

(declare-fun e!241971 () Bool)

(declare-fun tp_is_empty!10069 () Bool)

(assert (=> b!401230 (= e!241971 tp_is_empty!10069)))

(declare-fun b!401231 () Bool)

(declare-fun res!230939 () Bool)

(assert (=> b!401231 (=> (not res!230939) (not e!241968))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!401231 (= res!230939 (validKeyInArray!0 k!794))))

(declare-fun b!401232 () Bool)

(declare-fun e!241966 () Bool)

(declare-fun e!241965 () Bool)

(declare-fun mapRes!16725 () Bool)

(assert (=> b!401232 (= e!241966 (and e!241965 mapRes!16725))))

(declare-fun condMapEmpty!16725 () Bool)

(declare-fun mapDefault!16725 () ValueCell!4691)

