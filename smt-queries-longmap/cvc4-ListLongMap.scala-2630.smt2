; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39602 () Bool)

(assert start!39602)

(declare-fun b_free!9869 () Bool)

(declare-fun b_next!9869 () Bool)

(assert (=> start!39602 (= b_free!9869 (not b_next!9869))))

(declare-fun tp!35135 () Bool)

(declare-fun b_and!17525 () Bool)

(assert (=> start!39602 (= tp!35135 b_and!17525)))

(declare-fun b!424299 () Bool)

(declare-fun res!248170 () Bool)

(declare-fun e!252083 () Bool)

(assert (=> b!424299 (=> (not res!248170) (not e!252083))))

(declare-datatypes ((array!25881 0))(
  ( (array!25882 (arr!12390 (Array (_ BitVec 32) (_ BitVec 64))) (size!12742 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25881)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25881 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!424299 (= res!248170 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!424300 () Bool)

(declare-fun res!248171 () Bool)

(assert (=> b!424300 (=> (not res!248171) (not e!252083))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!424300 (= res!248171 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12742 _keys!709))))))

(declare-fun b!424301 () Bool)

(declare-fun res!248167 () Bool)

(assert (=> b!424301 (=> (not res!248167) (not e!252083))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15799 0))(
  ( (V!15800 (val!5555 Int)) )
))
(declare-datatypes ((ValueCell!5167 0))(
  ( (ValueCellFull!5167 (v!7802 V!15799)) (EmptyCell!5167) )
))
(declare-datatypes ((array!25883 0))(
  ( (array!25884 (arr!12391 (Array (_ BitVec 32) ValueCell!5167)) (size!12743 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25883)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!424301 (= res!248167 (and (= (size!12743 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12742 _keys!709) (size!12743 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!424302 () Bool)

(declare-fun res!248173 () Bool)

(assert (=> b!424302 (=> (not res!248173) (not e!252083))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!424302 (= res!248173 (validKeyInArray!0 k!794))))

(declare-fun b!424303 () Bool)

(declare-fun res!248165 () Bool)

(assert (=> b!424303 (=> (not res!248165) (not e!252083))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25881 (_ BitVec 32)) Bool)

(assert (=> b!424303 (= res!248165 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!424304 () Bool)

(declare-fun res!248169 () Bool)

(assert (=> b!424304 (=> (not res!248169) (not e!252083))))

(assert (=> b!424304 (= res!248169 (or (= (select (arr!12390 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12390 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!18153 () Bool)

(declare-fun mapRes!18153 () Bool)

(declare-fun tp!35136 () Bool)

(declare-fun e!252084 () Bool)

(assert (=> mapNonEmpty!18153 (= mapRes!18153 (and tp!35136 e!252084))))

(declare-fun mapValue!18153 () ValueCell!5167)

(declare-fun mapKey!18153 () (_ BitVec 32))

(declare-fun mapRest!18153 () (Array (_ BitVec 32) ValueCell!5167))

(assert (=> mapNonEmpty!18153 (= (arr!12391 _values!549) (store mapRest!18153 mapKey!18153 mapValue!18153))))

(declare-fun b!424305 () Bool)

(declare-fun res!248166 () Bool)

(assert (=> b!424305 (=> (not res!248166) (not e!252083))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!424305 (= res!248166 (validMask!0 mask!1025))))

(declare-fun res!248168 () Bool)

(assert (=> start!39602 (=> (not res!248168) (not e!252083))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39602 (= res!248168 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12742 _keys!709))))))

(assert (=> start!39602 e!252083))

(declare-fun tp_is_empty!11021 () Bool)

(assert (=> start!39602 tp_is_empty!11021))

(assert (=> start!39602 tp!35135))

(assert (=> start!39602 true))

(declare-fun e!252080 () Bool)

(declare-fun array_inv!9030 (array!25883) Bool)

(assert (=> start!39602 (and (array_inv!9030 _values!549) e!252080)))

(declare-fun array_inv!9031 (array!25881) Bool)

(assert (=> start!39602 (array_inv!9031 _keys!709)))

(declare-fun b!424306 () Bool)

(declare-fun e!252079 () Bool)

(assert (=> b!424306 (= e!252079 tp_is_empty!11021)))

(declare-fun b!424307 () Bool)

(assert (=> b!424307 (= e!252080 (and e!252079 mapRes!18153))))

(declare-fun condMapEmpty!18153 () Bool)

(declare-fun mapDefault!18153 () ValueCell!5167)

