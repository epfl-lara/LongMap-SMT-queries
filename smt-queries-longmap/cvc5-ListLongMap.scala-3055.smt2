; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43150 () Bool)

(assert start!43150)

(declare-fun b!478440 () Bool)

(declare-fun res!285449 () Bool)

(declare-fun e!281296 () Bool)

(assert (=> b!478440 (=> (not res!285449) (not e!281296))))

(declare-datatypes ((array!30795 0))(
  ( (array!30796 (arr!14807 (Array (_ BitVec 32) (_ BitVec 64))) (size!15165 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30795)

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30795 (_ BitVec 32)) Bool)

(assert (=> b!478440 (= res!285449 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun res!285450 () Bool)

(assert (=> start!43150 (=> (not res!285450) (not e!281296))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43150 (= res!285450 (validMask!0 mask!2352))))

(assert (=> start!43150 e!281296))

(assert (=> start!43150 true))

(declare-datatypes ((V!19153 0))(
  ( (V!19154 (val!6828 Int)) )
))
(declare-datatypes ((ValueCell!6419 0))(
  ( (ValueCellFull!6419 (v!9116 V!19153)) (EmptyCell!6419) )
))
(declare-datatypes ((array!30797 0))(
  ( (array!30798 (arr!14808 (Array (_ BitVec 32) ValueCell!6419)) (size!15166 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30797)

(declare-fun e!281295 () Bool)

(declare-fun array_inv!10682 (array!30797) Bool)

(assert (=> start!43150 (and (array_inv!10682 _values!1516) e!281295)))

(declare-fun array_inv!10683 (array!30795) Bool)

(assert (=> start!43150 (array_inv!10683 _keys!1874)))

(declare-fun b!478441 () Bool)

(declare-fun res!285451 () Bool)

(assert (=> b!478441 (=> (not res!285451) (not e!281296))))

(assert (=> b!478441 (= res!285451 (and (bvsle #b00000000000000000000000000000000 (size!15165 _keys!1874)) (bvslt (size!15165 _keys!1874) #b01111111111111111111111111111111)))))

(declare-fun mapIsEmpty!22030 () Bool)

(declare-fun mapRes!22030 () Bool)

(assert (=> mapIsEmpty!22030 mapRes!22030))

(declare-fun mapNonEmpty!22030 () Bool)

(declare-fun tp!42505 () Bool)

(declare-fun e!281299 () Bool)

(assert (=> mapNonEmpty!22030 (= mapRes!22030 (and tp!42505 e!281299))))

(declare-fun mapKey!22030 () (_ BitVec 32))

(declare-fun mapValue!22030 () ValueCell!6419)

(declare-fun mapRest!22030 () (Array (_ BitVec 32) ValueCell!6419))

(assert (=> mapNonEmpty!22030 (= (arr!14808 _values!1516) (store mapRest!22030 mapKey!22030 mapValue!22030))))

(declare-fun b!478442 () Bool)

(declare-fun res!285448 () Bool)

(assert (=> b!478442 (=> (not res!285448) (not e!281296))))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!478442 (= res!285448 (and (= (size!15166 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15165 _keys!1874) (size!15166 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!478443 () Bool)

(declare-datatypes ((List!9059 0))(
  ( (Nil!9056) (Cons!9055 (h!9911 (_ BitVec 64)) (t!15265 List!9059)) )
))
(declare-fun noDuplicate!203 (List!9059) Bool)

(assert (=> b!478443 (= e!281296 (not (noDuplicate!203 Nil!9056)))))

(declare-fun b!478444 () Bool)

(declare-fun e!281298 () Bool)

(assert (=> b!478444 (= e!281295 (and e!281298 mapRes!22030))))

(declare-fun condMapEmpty!22030 () Bool)

(declare-fun mapDefault!22030 () ValueCell!6419)

