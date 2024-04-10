; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94284 () Bool)

(assert start!94284)

(declare-fun b_free!21647 () Bool)

(declare-fun b_next!21647 () Bool)

(assert (=> start!94284 (= b_free!21647 (not b_next!21647))))

(declare-fun tp!76381 () Bool)

(declare-fun b_and!34419 () Bool)

(assert (=> start!94284 (= tp!76381 b_and!34419)))

(declare-fun b!1066201 () Bool)

(declare-fun res!711628 () Bool)

(declare-fun e!607937 () Bool)

(assert (=> b!1066201 (=> (not res!711628) (not e!607937))))

(declare-datatypes ((array!67899 0))(
  ( (array!67900 (arr!32651 (Array (_ BitVec 32) (_ BitVec 64))) (size!33187 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67899)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67899 (_ BitVec 32)) Bool)

(assert (=> b!1066201 (= res!711628 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1066202 () Bool)

(declare-fun e!607940 () Bool)

(declare-fun e!607939 () Bool)

(declare-fun mapRes!39874 () Bool)

(assert (=> b!1066202 (= e!607940 (and e!607939 mapRes!39874))))

(declare-fun condMapEmpty!39874 () Bool)

(declare-datatypes ((V!39077 0))(
  ( (V!39078 (val!12779 Int)) )
))
(declare-datatypes ((ValueCell!12025 0))(
  ( (ValueCellFull!12025 (v!15392 V!39077)) (EmptyCell!12025) )
))
(declare-datatypes ((array!67901 0))(
  ( (array!67902 (arr!32652 (Array (_ BitVec 32) ValueCell!12025)) (size!33188 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67901)

(declare-fun mapDefault!39874 () ValueCell!12025)

