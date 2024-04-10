; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38630 () Bool)

(assert start!38630)

(declare-fun b_free!9167 () Bool)

(declare-fun b_next!9167 () Bool)

(assert (=> start!38630 (= b_free!9167 (not b_next!9167))))

(declare-fun tp!32624 () Bool)

(declare-fun b_and!16553 () Bool)

(assert (=> start!38630 (= tp!32624 b_and!16553)))

(declare-fun b!400717 () Bool)

(declare-fun res!230588 () Bool)

(declare-fun e!241758 () Bool)

(assert (=> b!400717 (=> (not res!230588) (not e!241758))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!24007 0))(
  ( (array!24008 (arr!11453 (Array (_ BitVec 32) (_ BitVec 64))) (size!11805 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24007)

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!400717 (= res!230588 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11805 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!400718 () Bool)

(assert (=> b!400718 (= e!241758 (not true))))

(declare-fun e!241760 () Bool)

(assert (=> b!400718 e!241760))

(declare-fun c!54707 () Bool)

(assert (=> b!400718 (= c!54707 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((V!14503 0))(
  ( (V!14504 (val!5069 Int)) )
))
(declare-fun minValue!515 () V!14503)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((Unit!12138 0))(
  ( (Unit!12139) )
))
(declare-fun lt!187727 () Unit!12138)

(declare-datatypes ((ValueCell!4681 0))(
  ( (ValueCellFull!4681 (v!7316 V!14503)) (EmptyCell!4681) )
))
(declare-datatypes ((array!24009 0))(
  ( (array!24010 (arr!11454 (Array (_ BitVec 32) ValueCell!4681)) (size!11806 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24009)

(declare-fun zeroValue!515 () V!14503)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun v!412 () V!14503)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!327 (array!24007 array!24009 (_ BitVec 32) (_ BitVec 32) V!14503 V!14503 (_ BitVec 32) (_ BitVec 64) V!14503 (_ BitVec 32) Int) Unit!12138)

(assert (=> b!400718 (= lt!187727 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!327 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!400719 () Bool)

(declare-fun res!230586 () Bool)

(declare-fun e!241755 () Bool)

(assert (=> b!400719 (=> (not res!230586) (not e!241755))))

(assert (=> b!400719 (= res!230586 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11805 _keys!709))))))

(declare-fun b!400720 () Bool)

(declare-fun e!241756 () Bool)

(declare-fun e!241759 () Bool)

(declare-fun mapRes!16695 () Bool)

(assert (=> b!400720 (= e!241756 (and e!241759 mapRes!16695))))

(declare-fun condMapEmpty!16695 () Bool)

(declare-fun mapDefault!16695 () ValueCell!4681)

