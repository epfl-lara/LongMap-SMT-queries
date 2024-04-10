; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20236 () Bool)

(assert start!20236)

(declare-fun b_free!4895 () Bool)

(declare-fun b_next!4895 () Bool)

(assert (=> start!20236 (= b_free!4895 (not b_next!4895))))

(declare-fun tp!17717 () Bool)

(declare-fun b_and!11641 () Bool)

(assert (=> start!20236 (= tp!17717 b_and!11641)))

(declare-fun b!198974 () Bool)

(declare-fun res!94462 () Bool)

(declare-fun e!130690 () Bool)

(assert (=> b!198974 (=> (not res!94462) (not e!130690))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!198974 (= res!94462 (validKeyInArray!0 k!843))))

(declare-fun mapNonEmpty!8195 () Bool)

(declare-fun mapRes!8195 () Bool)

(declare-fun tp!17716 () Bool)

(declare-fun e!130693 () Bool)

(assert (=> mapNonEmpty!8195 (= mapRes!8195 (and tp!17716 e!130693))))

(declare-datatypes ((V!5981 0))(
  ( (V!5982 (val!2420 Int)) )
))
(declare-datatypes ((ValueCell!2032 0))(
  ( (ValueCellFull!2032 (v!4390 V!5981)) (EmptyCell!2032) )
))
(declare-fun mapValue!8195 () ValueCell!2032)

(declare-datatypes ((array!8743 0))(
  ( (array!8744 (arr!4122 (Array (_ BitVec 32) ValueCell!2032)) (size!4447 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8743)

(declare-fun mapRest!8195 () (Array (_ BitVec 32) ValueCell!2032))

(declare-fun mapKey!8195 () (_ BitVec 32))

(assert (=> mapNonEmpty!8195 (= (arr!4122 _values!649) (store mapRest!8195 mapKey!8195 mapValue!8195))))

(declare-fun b!198975 () Bool)

(declare-fun e!130692 () Bool)

(declare-fun tp_is_empty!4751 () Bool)

(assert (=> b!198975 (= e!130692 tp_is_empty!4751)))

(declare-fun res!94464 () Bool)

(assert (=> start!20236 (=> (not res!94464) (not e!130690))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20236 (= res!94464 (validMask!0 mask!1149))))

(assert (=> start!20236 e!130690))

(declare-fun e!130694 () Bool)

(declare-fun array_inv!2699 (array!8743) Bool)

(assert (=> start!20236 (and (array_inv!2699 _values!649) e!130694)))

(assert (=> start!20236 true))

(assert (=> start!20236 tp_is_empty!4751))

(declare-datatypes ((array!8745 0))(
  ( (array!8746 (arr!4123 (Array (_ BitVec 32) (_ BitVec 64))) (size!4448 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8745)

(declare-fun array_inv!2700 (array!8745) Bool)

(assert (=> start!20236 (array_inv!2700 _keys!825)))

(assert (=> start!20236 tp!17717))

(declare-fun b!198976 () Bool)

(declare-fun res!94465 () Bool)

(assert (=> b!198976 (=> (not res!94465) (not e!130690))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!198976 (= res!94465 (= (select (arr!4123 _keys!825) i!601) k!843))))

(declare-fun b!198977 () Bool)

(declare-fun res!94468 () Bool)

(assert (=> b!198977 (=> (not res!94468) (not e!130690))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8745 (_ BitVec 32)) Bool)

(assert (=> b!198977 (= res!94468 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!198978 () Bool)

(assert (=> b!198978 (= e!130694 (and e!130692 mapRes!8195))))

(declare-fun condMapEmpty!8195 () Bool)

(declare-fun mapDefault!8195 () ValueCell!2032)

