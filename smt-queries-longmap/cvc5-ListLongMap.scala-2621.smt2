; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39544 () Bool)

(assert start!39544)

(declare-fun b_free!9811 () Bool)

(declare-fun b_next!9811 () Bool)

(assert (=> start!39544 (= b_free!9811 (not b_next!9811))))

(declare-fun tp!34962 () Bool)

(declare-fun b_and!17467 () Bool)

(assert (=> start!39544 (= tp!34962 b_and!17467)))

(declare-fun b!422994 () Bool)

(declare-fun e!251560 () Bool)

(declare-fun tp_is_empty!10963 () Bool)

(assert (=> b!422994 (= e!251560 tp_is_empty!10963)))

(declare-fun b!422995 () Bool)

(declare-fun res!247121 () Bool)

(declare-fun e!251557 () Bool)

(assert (=> b!422995 (=> (not res!247121) (not e!251557))))

(declare-datatypes ((array!25773 0))(
  ( (array!25774 (arr!12336 (Array (_ BitVec 32) (_ BitVec 64))) (size!12688 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25773)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!422995 (= res!247121 (or (= (select (arr!12336 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12336 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!422996 () Bool)

(declare-fun e!251562 () Bool)

(assert (=> b!422996 (= e!251562 tp_is_empty!10963)))

(declare-fun b!422998 () Bool)

(declare-fun res!247131 () Bool)

(assert (=> b!422998 (=> (not res!247131) (not e!251557))))

(declare-datatypes ((List!7264 0))(
  ( (Nil!7261) (Cons!7260 (h!8116 (_ BitVec 64)) (t!12708 List!7264)) )
))
(declare-fun arrayNoDuplicates!0 (array!25773 (_ BitVec 32) List!7264) Bool)

(assert (=> b!422998 (= res!247131 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7261))))

(declare-fun b!422999 () Bool)

(declare-fun res!247129 () Bool)

(assert (=> b!422999 (=> (not res!247129) (not e!251557))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15723 0))(
  ( (V!15724 (val!5526 Int)) )
))
(declare-datatypes ((ValueCell!5138 0))(
  ( (ValueCellFull!5138 (v!7773 V!15723)) (EmptyCell!5138) )
))
(declare-datatypes ((array!25775 0))(
  ( (array!25776 (arr!12337 (Array (_ BitVec 32) ValueCell!5138)) (size!12689 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25775)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!422999 (= res!247129 (and (= (size!12689 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12688 _keys!709) (size!12689 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!423000 () Bool)

(declare-fun res!247124 () Bool)

(assert (=> b!423000 (=> (not res!247124) (not e!251557))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!423000 (= res!247124 (validKeyInArray!0 k!794))))

(declare-fun b!423001 () Bool)

(declare-fun e!251559 () Bool)

(assert (=> b!423001 (= e!251557 e!251559)))

(declare-fun res!247123 () Bool)

(assert (=> b!423001 (=> (not res!247123) (not e!251559))))

(declare-fun lt!194080 () array!25773)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25773 (_ BitVec 32)) Bool)

(assert (=> b!423001 (= res!247123 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194080 mask!1025))))

(assert (=> b!423001 (= lt!194080 (array!25774 (store (arr!12336 _keys!709) i!563 k!794) (size!12688 _keys!709)))))

(declare-fun mapIsEmpty!18066 () Bool)

(declare-fun mapRes!18066 () Bool)

(assert (=> mapIsEmpty!18066 mapRes!18066))

(declare-fun b!423002 () Bool)

(declare-fun res!247130 () Bool)

(assert (=> b!423002 (=> (not res!247130) (not e!251559))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!423002 (= res!247130 (bvsle from!863 i!563))))

(declare-fun mapNonEmpty!18066 () Bool)

(declare-fun tp!34961 () Bool)

(assert (=> mapNonEmpty!18066 (= mapRes!18066 (and tp!34961 e!251560))))

(declare-fun mapKey!18066 () (_ BitVec 32))

(declare-fun mapRest!18066 () (Array (_ BitVec 32) ValueCell!5138))

(declare-fun mapValue!18066 () ValueCell!5138)

(assert (=> mapNonEmpty!18066 (= (arr!12337 _values!549) (store mapRest!18066 mapKey!18066 mapValue!18066))))

(declare-fun b!423003 () Bool)

(declare-fun res!247127 () Bool)

(assert (=> b!423003 (=> (not res!247127) (not e!251557))))

(assert (=> b!423003 (= res!247127 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12688 _keys!709))))))

(declare-fun b!423004 () Bool)

(declare-fun res!247125 () Bool)

(assert (=> b!423004 (=> (not res!247125) (not e!251557))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!423004 (= res!247125 (validMask!0 mask!1025))))

(declare-fun b!423005 () Bool)

(declare-fun e!251558 () Bool)

(assert (=> b!423005 (= e!251558 (and e!251562 mapRes!18066))))

(declare-fun condMapEmpty!18066 () Bool)

(declare-fun mapDefault!18066 () ValueCell!5138)

