; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70998 () Bool)

(assert start!70998)

(declare-fun b_free!13201 () Bool)

(declare-fun b_next!13201 () Bool)

(assert (=> start!70998 (= b_free!13201 (not b_next!13201))))

(declare-fun tp!46356 () Bool)

(declare-fun b_and!22105 () Bool)

(assert (=> start!70998 (= tp!46356 b_and!22105)))

(declare-fun res!562091 () Bool)

(declare-fun e!458697 () Bool)

(assert (=> start!70998 (=> (not res!562091) (not e!458697))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70998 (= res!562091 (validMask!0 mask!1312))))

(assert (=> start!70998 e!458697))

(declare-fun tp_is_empty!14911 () Bool)

(assert (=> start!70998 tp_is_empty!14911))

(declare-datatypes ((array!46010 0))(
  ( (array!46011 (arr!22052 (Array (_ BitVec 32) (_ BitVec 64))) (size!22473 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46010)

(declare-fun array_inv!17595 (array!46010) Bool)

(assert (=> start!70998 (array_inv!17595 _keys!976)))

(assert (=> start!70998 true))

(declare-datatypes ((V!24883 0))(
  ( (V!24884 (val!7503 Int)) )
))
(declare-datatypes ((ValueCell!7040 0))(
  ( (ValueCellFull!7040 (v!9936 V!24883)) (EmptyCell!7040) )
))
(declare-datatypes ((array!46012 0))(
  ( (array!46013 (arr!22053 (Array (_ BitVec 32) ValueCell!7040)) (size!22474 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46012)

(declare-fun e!458698 () Bool)

(declare-fun array_inv!17596 (array!46012) Bool)

(assert (=> start!70998 (and (array_inv!17596 _values!788) e!458698)))

(assert (=> start!70998 tp!46356))

(declare-fun b!824452 () Bool)

(declare-fun e!458696 () Bool)

(declare-fun mapRes!23986 () Bool)

(assert (=> b!824452 (= e!458698 (and e!458696 mapRes!23986))))

(declare-fun condMapEmpty!23986 () Bool)

(declare-fun mapDefault!23986 () ValueCell!7040)

