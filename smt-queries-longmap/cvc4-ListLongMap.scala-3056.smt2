; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43170 () Bool)

(assert start!43170)

(declare-fun b!478587 () Bool)

(declare-fun e!281403 () Bool)

(declare-datatypes ((List!9063 0))(
  ( (Nil!9060) (Cons!9059 (h!9915 (_ BitVec 64)) (t!15269 List!9063)) )
))
(declare-fun contains!2582 (List!9063 (_ BitVec 64)) Bool)

(assert (=> b!478587 (= e!281403 (contains!2582 Nil!9060 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!478588 () Bool)

(declare-fun e!281401 () Bool)

(declare-fun tp_is_empty!13571 () Bool)

(assert (=> b!478588 (= e!281401 tp_is_empty!13571)))

(declare-fun b!478589 () Bool)

(declare-fun res!285539 () Bool)

(declare-fun e!281402 () Bool)

(assert (=> b!478589 (=> (not res!285539) (not e!281402))))

(declare-datatypes ((array!30817 0))(
  ( (array!30818 (arr!14817 (Array (_ BitVec 32) (_ BitVec 64))) (size!15175 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30817)

(assert (=> b!478589 (= res!285539 (and (bvsle #b00000000000000000000000000000000 (size!15175 _keys!1874)) (bvslt (size!15175 _keys!1874) #b01111111111111111111111111111111)))))

(declare-fun mapIsEmpty!22048 () Bool)

(declare-fun mapRes!22048 () Bool)

(assert (=> mapIsEmpty!22048 mapRes!22048))

(declare-fun mapNonEmpty!22048 () Bool)

(declare-fun tp!42523 () Bool)

(assert (=> mapNonEmpty!22048 (= mapRes!22048 (and tp!42523 e!281401))))

(declare-datatypes ((V!19165 0))(
  ( (V!19166 (val!6833 Int)) )
))
(declare-datatypes ((ValueCell!6424 0))(
  ( (ValueCellFull!6424 (v!9121 V!19165)) (EmptyCell!6424) )
))
(declare-fun mapValue!22048 () ValueCell!6424)

(declare-fun mapKey!22048 () (_ BitVec 32))

(declare-fun mapRest!22048 () (Array (_ BitVec 32) ValueCell!6424))

(declare-datatypes ((array!30819 0))(
  ( (array!30820 (arr!14818 (Array (_ BitVec 32) ValueCell!6424)) (size!15176 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30819)

(assert (=> mapNonEmpty!22048 (= (arr!14818 _values!1516) (store mapRest!22048 mapKey!22048 mapValue!22048))))

(declare-fun b!478590 () Bool)

(declare-fun e!281400 () Bool)

(declare-fun e!281399 () Bool)

(assert (=> b!478590 (= e!281400 (and e!281399 mapRes!22048))))

(declare-fun condMapEmpty!22048 () Bool)

(declare-fun mapDefault!22048 () ValueCell!6424)

