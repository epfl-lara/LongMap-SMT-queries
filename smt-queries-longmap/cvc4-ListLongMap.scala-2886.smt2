; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41450 () Bool)

(assert start!41450)

(declare-fun b_free!11129 () Bool)

(declare-fun b_next!11129 () Bool)

(assert (=> start!41450 (= b_free!11129 (not b_next!11129))))

(declare-fun tp!39382 () Bool)

(declare-fun b_and!19465 () Bool)

(assert (=> start!41450 (= tp!39382 b_and!19465)))

(declare-fun b!463128 () Bool)

(declare-fun e!270367 () Bool)

(declare-fun e!270365 () Bool)

(declare-fun mapRes!20509 () Bool)

(assert (=> b!463128 (= e!270367 (and e!270365 mapRes!20509))))

(declare-fun condMapEmpty!20509 () Bool)

(declare-datatypes ((V!17847 0))(
  ( (V!17848 (val!6323 Int)) )
))
(declare-datatypes ((ValueCell!5935 0))(
  ( (ValueCellFull!5935 (v!8610 V!17847)) (EmptyCell!5935) )
))
(declare-datatypes ((array!28911 0))(
  ( (array!28912 (arr!13888 (Array (_ BitVec 32) ValueCell!5935)) (size!14240 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28911)

(declare-fun mapDefault!20509 () ValueCell!5935)

