; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35864 () Bool)

(assert start!35864)

(declare-fun b!360579 () Bool)

(declare-fun res!200557 () Bool)

(declare-fun e!220753 () Bool)

(assert (=> b!360579 (=> (not res!200557) (not e!220753))))

(declare-fun k!1077 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!360579 (= res!200557 (validKeyInArray!0 k!1077))))

(declare-fun res!200560 () Bool)

(assert (=> start!35864 (=> (not res!200560) (not e!220753))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35864 (= res!200560 (validMask!0 mask!1842))))

(assert (=> start!35864 e!220753))

(declare-fun tp_is_empty!8317 () Bool)

(assert (=> start!35864 tp_is_empty!8317))

(assert (=> start!35864 true))

(declare-datatypes ((array!20185 0))(
  ( (array!20186 (arr!9586 (Array (_ BitVec 32) (_ BitVec 64))) (size!9938 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20185)

(declare-fun array_inv!7052 (array!20185) Bool)

(assert (=> start!35864 (array_inv!7052 _keys!1456)))

(declare-datatypes ((V!12067 0))(
  ( (V!12068 (val!4203 Int)) )
))
(declare-datatypes ((ValueCell!3815 0))(
  ( (ValueCellFull!3815 (v!6397 V!12067)) (EmptyCell!3815) )
))
(declare-datatypes ((array!20187 0))(
  ( (array!20188 (arr!9587 (Array (_ BitVec 32) ValueCell!3815)) (size!9939 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20187)

(declare-fun e!220755 () Bool)

(declare-fun array_inv!7053 (array!20187) Bool)

(assert (=> start!35864 (and (array_inv!7053 _values!1208) e!220755)))

(declare-fun b!360580 () Bool)

(declare-fun e!220757 () Bool)

(declare-fun mapRes!13983 () Bool)

(assert (=> b!360580 (= e!220755 (and e!220757 mapRes!13983))))

(declare-fun condMapEmpty!13983 () Bool)

(declare-fun mapDefault!13983 () ValueCell!3815)

