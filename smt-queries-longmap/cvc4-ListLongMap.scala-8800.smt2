; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107028 () Bool)

(assert start!107028)

(declare-fun b!1268951 () Bool)

(declare-fun res!844508 () Bool)

(declare-fun e!723213 () Bool)

(assert (=> b!1268951 (=> (not res!844508) (not e!723213))))

(declare-datatypes ((array!82702 0))(
  ( (array!82703 (arr!39888 (Array (_ BitVec 32) (_ BitVec 64))) (size!40424 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82702)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82702 (_ BitVec 32)) Bool)

(assert (=> b!1268951 (= res!844508 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun mapIsEmpty!50656 () Bool)

(declare-fun mapRes!50656 () Bool)

(assert (=> mapIsEmpty!50656 mapRes!50656))

(declare-fun b!1268952 () Bool)

(declare-fun e!723210 () Bool)

(declare-fun e!723209 () Bool)

(assert (=> b!1268952 (= e!723210 (and e!723209 mapRes!50656))))

(declare-fun condMapEmpty!50656 () Bool)

(declare-datatypes ((V!48815 0))(
  ( (V!48816 (val!16433 Int)) )
))
(declare-datatypes ((ValueCell!15505 0))(
  ( (ValueCellFull!15505 (v!19070 V!48815)) (EmptyCell!15505) )
))
(declare-datatypes ((array!82704 0))(
  ( (array!82705 (arr!39889 (Array (_ BitVec 32) ValueCell!15505)) (size!40425 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82704)

(declare-fun mapDefault!50656 () ValueCell!15505)

