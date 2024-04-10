; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20670 () Bool)

(assert start!20670)

(declare-fun b_free!5329 () Bool)

(declare-fun b_next!5329 () Bool)

(assert (=> start!20670 (= b_free!5329 (not b_next!5329))))

(declare-fun tp!19019 () Bool)

(declare-fun b_and!12075 () Bool)

(assert (=> start!20670 (= tp!19019 b_and!12075)))

(declare-fun b!206546 () Bool)

(declare-fun res!100081 () Bool)

(declare-fun e!134984 () Bool)

(assert (=> b!206546 (=> (not res!100081) (not e!134984))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!206546 (= res!100081 (validKeyInArray!0 k!843))))

(declare-fun res!100085 () Bool)

(assert (=> start!20670 (=> (not res!100085) (not e!134984))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20670 (= res!100085 (validMask!0 mask!1149))))

(assert (=> start!20670 e!134984))

(declare-datatypes ((V!6561 0))(
  ( (V!6562 (val!2637 Int)) )
))
(declare-datatypes ((ValueCell!2249 0))(
  ( (ValueCellFull!2249 (v!4607 V!6561)) (EmptyCell!2249) )
))
(declare-datatypes ((array!9581 0))(
  ( (array!9582 (arr!4541 (Array (_ BitVec 32) ValueCell!2249)) (size!4866 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9581)

(declare-fun e!134981 () Bool)

(declare-fun array_inv!3003 (array!9581) Bool)

(assert (=> start!20670 (and (array_inv!3003 _values!649) e!134981)))

(assert (=> start!20670 true))

(declare-fun tp_is_empty!5185 () Bool)

(assert (=> start!20670 tp_is_empty!5185))

(declare-datatypes ((array!9583 0))(
  ( (array!9584 (arr!4542 (Array (_ BitVec 32) (_ BitVec 64))) (size!4867 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9583)

(declare-fun array_inv!3004 (array!9583) Bool)

(assert (=> start!20670 (array_inv!3004 _keys!825)))

(assert (=> start!20670 tp!19019))

(declare-fun b!206547 () Bool)

(declare-fun res!100083 () Bool)

(assert (=> b!206547 (=> (not res!100083) (not e!134984))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9583 (_ BitVec 32)) Bool)

(assert (=> b!206547 (= res!100083 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!206548 () Bool)

(declare-fun res!100084 () Bool)

(assert (=> b!206548 (=> (not res!100084) (not e!134984))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!206548 (= res!100084 (= (select (arr!4542 _keys!825) i!601) k!843))))

(declare-fun b!206549 () Bool)

(declare-fun res!100082 () Bool)

(assert (=> b!206549 (=> (not res!100082) (not e!134984))))

(declare-datatypes ((List!2897 0))(
  ( (Nil!2894) (Cons!2893 (h!3535 (_ BitVec 64)) (t!7828 List!2897)) )
))
(declare-fun arrayNoDuplicates!0 (array!9583 (_ BitVec 32) List!2897) Bool)

(assert (=> b!206549 (= res!100082 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2894))))

(declare-fun b!206550 () Bool)

(declare-fun e!134983 () Bool)

(declare-fun mapRes!8846 () Bool)

(assert (=> b!206550 (= e!134981 (and e!134983 mapRes!8846))))

(declare-fun condMapEmpty!8846 () Bool)

(declare-fun mapDefault!8846 () ValueCell!2249)

