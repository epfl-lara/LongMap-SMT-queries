; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40452 () Bool)

(assert start!40452)

(declare-fun b!445160 () Bool)

(declare-fun res!264092 () Bool)

(declare-fun e!261707 () Bool)

(assert (=> b!445160 (=> (not res!264092) (not e!261707))))

(declare-datatypes ((array!27481 0))(
  ( (array!27482 (arr!13188 (Array (_ BitVec 32) (_ BitVec 64))) (size!13540 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27481)

(declare-datatypes ((List!7885 0))(
  ( (Nil!7882) (Cons!7881 (h!8737 (_ BitVec 64)) (t!13643 List!7885)) )
))
(declare-fun arrayNoDuplicates!0 (array!27481 (_ BitVec 32) List!7885) Bool)

(assert (=> b!445160 (= res!264092 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7882))))

(declare-fun mapIsEmpty!19383 () Bool)

(declare-fun mapRes!19383 () Bool)

(assert (=> mapIsEmpty!19383 mapRes!19383))

(declare-fun b!445161 () Bool)

(declare-fun e!261705 () Bool)

(declare-fun tp_is_empty!11837 () Bool)

(assert (=> b!445161 (= e!261705 tp_is_empty!11837)))

(declare-fun b!445162 () Bool)

(declare-fun res!264098 () Bool)

(assert (=> b!445162 (=> (not res!264098) (not e!261707))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27481 (_ BitVec 32)) Bool)

(assert (=> b!445162 (= res!264098 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!445163 () Bool)

(declare-fun res!264097 () Bool)

(assert (=> b!445163 (=> (not res!264097) (not e!261707))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!445163 (= res!264097 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13540 _keys!709))))))

(declare-fun b!445164 () Bool)

(declare-fun res!264100 () Bool)

(assert (=> b!445164 (=> (not res!264100) (not e!261707))))

(assert (=> b!445164 (= res!264100 (or (= (select (arr!13188 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13188 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!445165 () Bool)

(declare-fun res!264091 () Bool)

(assert (=> b!445165 (=> (not res!264091) (not e!261707))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27481 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!445165 (= res!264091 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!445166 () Bool)

(declare-fun e!261710 () Bool)

(assert (=> b!445166 (= e!261710 tp_is_empty!11837)))

(declare-fun mapNonEmpty!19383 () Bool)

(declare-fun tp!37365 () Bool)

(assert (=> mapNonEmpty!19383 (= mapRes!19383 (and tp!37365 e!261710))))

(declare-datatypes ((V!16887 0))(
  ( (V!16888 (val!5963 Int)) )
))
(declare-datatypes ((ValueCell!5575 0))(
  ( (ValueCellFull!5575 (v!8214 V!16887)) (EmptyCell!5575) )
))
(declare-fun mapRest!19383 () (Array (_ BitVec 32) ValueCell!5575))

(declare-fun mapValue!19383 () ValueCell!5575)

(declare-datatypes ((array!27483 0))(
  ( (array!27484 (arr!13189 (Array (_ BitVec 32) ValueCell!5575)) (size!13541 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27483)

(declare-fun mapKey!19383 () (_ BitVec 32))

(assert (=> mapNonEmpty!19383 (= (arr!13189 _values!549) (store mapRest!19383 mapKey!19383 mapValue!19383))))

(declare-fun b!445167 () Bool)

(declare-fun e!261709 () Bool)

(assert (=> b!445167 (= e!261709 (and e!261705 mapRes!19383))))

(declare-fun condMapEmpty!19383 () Bool)

(declare-fun mapDefault!19383 () ValueCell!5575)

