; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72716 () Bool)

(assert start!72716)

(declare-fun b!843983 () Bool)

(declare-fun e!470990 () Bool)

(assert (=> b!843983 (= e!470990 false)))

(declare-fun lt!381217 () Bool)

(declare-datatypes ((array!47776 0))(
  ( (array!47777 (arr!22919 (Array (_ BitVec 32) (_ BitVec 64))) (size!23359 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47776)

(declare-datatypes ((List!16257 0))(
  ( (Nil!16254) (Cons!16253 (h!17384 (_ BitVec 64)) (t!22628 List!16257)) )
))
(declare-fun arrayNoDuplicates!0 (array!47776 (_ BitVec 32) List!16257) Bool)

(assert (=> b!843983 (= lt!381217 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16254))))

(declare-fun b!843984 () Bool)

(declare-fun res!573471 () Bool)

(assert (=> b!843984 (=> (not res!573471) (not e!470990))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47776 (_ BitVec 32)) Bool)

(assert (=> b!843984 (= res!573471 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!843985 () Bool)

(declare-fun res!573472 () Bool)

(assert (=> b!843985 (=> (not res!573472) (not e!470990))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!26069 0))(
  ( (V!26070 (val!7931 Int)) )
))
(declare-datatypes ((ValueCell!7444 0))(
  ( (ValueCellFull!7444 (v!10356 V!26069)) (EmptyCell!7444) )
))
(declare-datatypes ((array!47778 0))(
  ( (array!47779 (arr!22920 (Array (_ BitVec 32) ValueCell!7444)) (size!23360 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47778)

(assert (=> b!843985 (= res!573472 (and (= (size!23360 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23359 _keys!868) (size!23360 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!573473 () Bool)

(assert (=> start!72716 (=> (not res!573473) (not e!470990))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72716 (= res!573473 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23359 _keys!868))))))

(assert (=> start!72716 e!470990))

(assert (=> start!72716 true))

(declare-fun array_inv!18226 (array!47776) Bool)

(assert (=> start!72716 (array_inv!18226 _keys!868)))

(declare-fun e!470988 () Bool)

(declare-fun array_inv!18227 (array!47778) Bool)

(assert (=> start!72716 (and (array_inv!18227 _values!688) e!470988)))

(declare-fun b!843986 () Bool)

(declare-fun e!470989 () Bool)

(declare-fun tp_is_empty!15767 () Bool)

(assert (=> b!843986 (= e!470989 tp_is_empty!15767)))

(declare-fun b!843987 () Bool)

(declare-fun e!470991 () Bool)

(assert (=> b!843987 (= e!470991 tp_is_empty!15767)))

(declare-fun mapIsEmpty!25250 () Bool)

(declare-fun mapRes!25250 () Bool)

(assert (=> mapIsEmpty!25250 mapRes!25250))

(declare-fun mapNonEmpty!25250 () Bool)

(declare-fun tp!48568 () Bool)

(assert (=> mapNonEmpty!25250 (= mapRes!25250 (and tp!48568 e!470989))))

(declare-fun mapValue!25250 () ValueCell!7444)

(declare-fun mapRest!25250 () (Array (_ BitVec 32) ValueCell!7444))

(declare-fun mapKey!25250 () (_ BitVec 32))

(assert (=> mapNonEmpty!25250 (= (arr!22920 _values!688) (store mapRest!25250 mapKey!25250 mapValue!25250))))

(declare-fun b!843988 () Bool)

(declare-fun res!573470 () Bool)

(assert (=> b!843988 (=> (not res!573470) (not e!470990))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!843988 (= res!573470 (validMask!0 mask!1196))))

(declare-fun b!843989 () Bool)

(assert (=> b!843989 (= e!470988 (and e!470991 mapRes!25250))))

(declare-fun condMapEmpty!25250 () Bool)

(declare-fun mapDefault!25250 () ValueCell!7444)

