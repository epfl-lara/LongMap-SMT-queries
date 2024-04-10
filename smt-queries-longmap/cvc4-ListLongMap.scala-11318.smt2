; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131816 () Bool)

(assert start!131816)

(declare-fun b!1543299 () Bool)

(declare-fun res!1058923 () Bool)

(declare-fun e!858846 () Bool)

(assert (=> b!1543299 (=> (not res!1058923) (not e!858846))))

(declare-datatypes ((array!102836 0))(
  ( (array!102837 (arr!49620 (Array (_ BitVec 32) (_ BitVec 64))) (size!50170 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102836)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((V!58849 0))(
  ( (V!58850 (val!18980 Int)) )
))
(declare-datatypes ((ValueCell!17992 0))(
  ( (ValueCellFull!17992 (v!21781 V!58849)) (EmptyCell!17992) )
))
(declare-datatypes ((array!102838 0))(
  ( (array!102839 (arr!49621 (Array (_ BitVec 32) ValueCell!17992)) (size!50171 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102838)

(assert (=> b!1543299 (= res!1058923 (and (= (size!50171 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50170 _keys!618) (size!50171 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1543300 () Bool)

(assert (=> b!1543300 (= e!858846 false)))

(declare-fun lt!665960 () Bool)

(declare-datatypes ((List!35916 0))(
  ( (Nil!35913) (Cons!35912 (h!37357 (_ BitVec 64)) (t!50610 List!35916)) )
))
(declare-fun arrayNoDuplicates!0 (array!102836 (_ BitVec 32) List!35916) Bool)

(assert (=> b!1543300 (= lt!665960 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35913))))

(declare-fun mapNonEmpty!58411 () Bool)

(declare-fun mapRes!58411 () Bool)

(declare-fun tp!110938 () Bool)

(declare-fun e!858847 () Bool)

(assert (=> mapNonEmpty!58411 (= mapRes!58411 (and tp!110938 e!858847))))

(declare-fun mapRest!58411 () (Array (_ BitVec 32) ValueCell!17992))

(declare-fun mapValue!58411 () ValueCell!17992)

(declare-fun mapKey!58411 () (_ BitVec 32))

(assert (=> mapNonEmpty!58411 (= (arr!49621 _values!470) (store mapRest!58411 mapKey!58411 mapValue!58411))))

(declare-fun b!1543301 () Bool)

(declare-fun tp_is_empty!37805 () Bool)

(assert (=> b!1543301 (= e!858847 tp_is_empty!37805)))

(declare-fun b!1543302 () Bool)

(declare-fun e!858848 () Bool)

(declare-fun e!858845 () Bool)

(assert (=> b!1543302 (= e!858848 (and e!858845 mapRes!58411))))

(declare-fun condMapEmpty!58411 () Bool)

(declare-fun mapDefault!58411 () ValueCell!17992)

