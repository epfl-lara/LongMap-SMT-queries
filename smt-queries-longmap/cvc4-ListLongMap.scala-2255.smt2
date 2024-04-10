; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36996 () Bool)

(assert start!36996)

(declare-fun b_free!8123 () Bool)

(declare-fun b_next!8123 () Bool)

(assert (=> start!36996 (= b_free!8123 (not b_next!8123))))

(declare-fun tp!29084 () Bool)

(declare-fun b_and!15365 () Bool)

(assert (=> start!36996 (= tp!29084 b_and!15365)))

(declare-fun res!208794 () Bool)

(declare-fun e!226716 () Bool)

(assert (=> start!36996 (=> (not res!208794) (not e!226716))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36996 (= res!208794 (validMask!0 mask!970))))

(assert (=> start!36996 e!226716))

(declare-datatypes ((V!12799 0))(
  ( (V!12800 (val!4430 Int)) )
))
(declare-datatypes ((ValueCell!4042 0))(
  ( (ValueCellFull!4042 (v!6627 V!12799)) (EmptyCell!4042) )
))
(declare-datatypes ((array!21483 0))(
  ( (array!21484 (arr!10210 (Array (_ BitVec 32) ValueCell!4042)) (size!10562 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21483)

(declare-fun e!226718 () Bool)

(declare-fun array_inv!7540 (array!21483) Bool)

(assert (=> start!36996 (and (array_inv!7540 _values!506) e!226718)))

(assert (=> start!36996 tp!29084))

(assert (=> start!36996 true))

(declare-fun tp_is_empty!8771 () Bool)

(assert (=> start!36996 tp_is_empty!8771))

(declare-datatypes ((array!21485 0))(
  ( (array!21486 (arr!10211 (Array (_ BitVec 32) (_ BitVec 64))) (size!10563 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21485)

(declare-fun array_inv!7541 (array!21485) Bool)

(assert (=> start!36996 (array_inv!7541 _keys!658)))

(declare-fun b!371438 () Bool)

(declare-fun res!208795 () Bool)

(assert (=> b!371438 (=> (not res!208795) (not e!226716))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!371438 (= res!208795 (validKeyInArray!0 k!778))))

(declare-fun b!371439 () Bool)

(declare-fun e!226721 () Bool)

(assert (=> b!371439 (= e!226721 tp_is_empty!8771)))

(declare-fun b!371440 () Bool)

(declare-fun e!226720 () Bool)

(declare-fun mapRes!14721 () Bool)

(assert (=> b!371440 (= e!226718 (and e!226720 mapRes!14721))))

(declare-fun condMapEmpty!14721 () Bool)

(declare-fun mapDefault!14721 () ValueCell!4042)

