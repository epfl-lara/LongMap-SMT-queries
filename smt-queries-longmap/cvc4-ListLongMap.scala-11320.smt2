; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131828 () Bool)

(assert start!131828)

(declare-fun b!1543407 () Bool)

(declare-fun e!858937 () Bool)

(assert (=> b!1543407 (= e!858937 false)))

(declare-fun lt!665978 () Bool)

(declare-datatypes ((array!102858 0))(
  ( (array!102859 (arr!49631 (Array (_ BitVec 32) (_ BitVec 64))) (size!50181 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102858)

(declare-datatypes ((List!35920 0))(
  ( (Nil!35917) (Cons!35916 (h!37361 (_ BitVec 64)) (t!50614 List!35920)) )
))
(declare-fun arrayNoDuplicates!0 (array!102858 (_ BitVec 32) List!35920) Bool)

(assert (=> b!1543407 (= lt!665978 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35917))))

(declare-fun b!1543408 () Bool)

(declare-fun res!1058978 () Bool)

(assert (=> b!1543408 (=> (not res!1058978) (not e!858937))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102858 (_ BitVec 32)) Bool)

(assert (=> b!1543408 (= res!1058978 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1543409 () Bool)

(declare-fun res!1058979 () Bool)

(assert (=> b!1543409 (=> (not res!1058979) (not e!858937))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-datatypes ((V!58865 0))(
  ( (V!58866 (val!18986 Int)) )
))
(declare-datatypes ((ValueCell!17998 0))(
  ( (ValueCellFull!17998 (v!21787 V!58865)) (EmptyCell!17998) )
))
(declare-datatypes ((array!102860 0))(
  ( (array!102861 (arr!49632 (Array (_ BitVec 32) ValueCell!17998)) (size!50182 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102860)

(assert (=> b!1543409 (= res!1058979 (and (= (size!50182 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50181 _keys!618) (size!50182 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!58429 () Bool)

(declare-fun mapRes!58429 () Bool)

(declare-fun tp!110956 () Bool)

(declare-fun e!858939 () Bool)

(assert (=> mapNonEmpty!58429 (= mapRes!58429 (and tp!110956 e!858939))))

(declare-fun mapRest!58429 () (Array (_ BitVec 32) ValueCell!17998))

(declare-fun mapValue!58429 () ValueCell!17998)

(declare-fun mapKey!58429 () (_ BitVec 32))

(assert (=> mapNonEmpty!58429 (= (arr!49632 _values!470) (store mapRest!58429 mapKey!58429 mapValue!58429))))

(declare-fun b!1543410 () Bool)

(declare-fun tp_is_empty!37817 () Bool)

(assert (=> b!1543410 (= e!858939 tp_is_empty!37817)))

(declare-fun b!1543411 () Bool)

(declare-fun e!858936 () Bool)

(declare-fun e!858938 () Bool)

(assert (=> b!1543411 (= e!858936 (and e!858938 mapRes!58429))))

(declare-fun condMapEmpty!58429 () Bool)

(declare-fun mapDefault!58429 () ValueCell!17998)

