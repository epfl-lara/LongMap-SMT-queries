; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83062 () Bool)

(assert start!83062)

(declare-fun res!648624 () Bool)

(declare-fun e!546210 () Bool)

(assert (=> start!83062 (=> (not res!648624) (not e!546210))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83062 (= res!648624 (validMask!0 mask!2147))))

(assert (=> start!83062 e!546210))

(assert (=> start!83062 true))

(declare-datatypes ((V!34253 0))(
  ( (V!34254 (val!11027 Int)) )
))
(declare-datatypes ((ValueCell!10495 0))(
  ( (ValueCellFull!10495 (v!13586 V!34253)) (EmptyCell!10495) )
))
(declare-datatypes ((array!59979 0))(
  ( (array!59980 (arr!28853 (Array (_ BitVec 32) ValueCell!10495)) (size!29332 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!59979)

(declare-fun e!546212 () Bool)

(declare-fun array_inv!22335 (array!59979) Bool)

(assert (=> start!83062 (and (array_inv!22335 _values!1425) e!546212)))

(declare-datatypes ((array!59981 0))(
  ( (array!59982 (arr!28854 (Array (_ BitVec 32) (_ BitVec 64))) (size!29333 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!59981)

(declare-fun array_inv!22336 (array!59981) Bool)

(assert (=> start!83062 (array_inv!22336 _keys!1717)))

(declare-fun b!969002 () Bool)

(declare-fun e!546213 () Bool)

(declare-fun tp_is_empty!21953 () Bool)

(assert (=> b!969002 (= e!546213 tp_is_empty!21953)))

(declare-fun mapNonEmpty!34939 () Bool)

(declare-fun mapRes!34939 () Bool)

(declare-fun tp!66507 () Bool)

(declare-fun e!546214 () Bool)

(assert (=> mapNonEmpty!34939 (= mapRes!34939 (and tp!66507 e!546214))))

(declare-fun mapRest!34939 () (Array (_ BitVec 32) ValueCell!10495))

(declare-fun mapValue!34939 () ValueCell!10495)

(declare-fun mapKey!34939 () (_ BitVec 32))

(assert (=> mapNonEmpty!34939 (= (arr!28853 _values!1425) (store mapRest!34939 mapKey!34939 mapValue!34939))))

(declare-fun b!969003 () Bool)

(assert (=> b!969003 (= e!546214 tp_is_empty!21953)))

(declare-fun b!969004 () Bool)

(assert (=> b!969004 (= e!546212 (and e!546213 mapRes!34939))))

(declare-fun condMapEmpty!34939 () Bool)

(declare-fun mapDefault!34939 () ValueCell!10495)

