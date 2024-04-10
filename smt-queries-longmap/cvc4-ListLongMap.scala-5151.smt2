; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69874 () Bool)

(assert start!69874)

(declare-fun b!812430 () Bool)

(declare-fun e!449985 () Bool)

(assert (=> b!812430 (= e!449985 false)))

(declare-fun lt!364137 () Bool)

(declare-datatypes ((array!44278 0))(
  ( (array!44279 (arr!21201 (Array (_ BitVec 32) (_ BitVec 64))) (size!21622 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44278)

(declare-datatypes ((List!15097 0))(
  ( (Nil!15094) (Cons!15093 (h!16222 (_ BitVec 64)) (t!21412 List!15097)) )
))
(declare-fun arrayNoDuplicates!0 (array!44278 (_ BitVec 32) List!15097) Bool)

(assert (=> b!812430 (= lt!364137 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15094))))

(declare-fun res!555172 () Bool)

(assert (=> start!69874 (=> (not res!555172) (not e!449985))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69874 (= res!555172 (validMask!0 mask!1312))))

(assert (=> start!69874 e!449985))

(declare-fun array_inv!16985 (array!44278) Bool)

(assert (=> start!69874 (array_inv!16985 _keys!976)))

(assert (=> start!69874 true))

(declare-datatypes ((V!23703 0))(
  ( (V!23704 (val!7061 Int)) )
))
(declare-datatypes ((ValueCell!6598 0))(
  ( (ValueCellFull!6598 (v!9488 V!23703)) (EmptyCell!6598) )
))
(declare-datatypes ((array!44280 0))(
  ( (array!44281 (arr!21202 (Array (_ BitVec 32) ValueCell!6598)) (size!21623 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44280)

(declare-fun e!449984 () Bool)

(declare-fun array_inv!16986 (array!44280) Bool)

(assert (=> start!69874 (and (array_inv!16986 _values!788) e!449984)))

(declare-fun mapNonEmpty!22615 () Bool)

(declare-fun mapRes!22615 () Bool)

(declare-fun tp!43723 () Bool)

(declare-fun e!449988 () Bool)

(assert (=> mapNonEmpty!22615 (= mapRes!22615 (and tp!43723 e!449988))))

(declare-fun mapKey!22615 () (_ BitVec 32))

(declare-fun mapValue!22615 () ValueCell!6598)

(declare-fun mapRest!22615 () (Array (_ BitVec 32) ValueCell!6598))

(assert (=> mapNonEmpty!22615 (= (arr!21202 _values!788) (store mapRest!22615 mapKey!22615 mapValue!22615))))

(declare-fun b!812431 () Bool)

(declare-fun e!449986 () Bool)

(declare-fun tp_is_empty!14027 () Bool)

(assert (=> b!812431 (= e!449986 tp_is_empty!14027)))

(declare-fun b!812432 () Bool)

(assert (=> b!812432 (= e!449984 (and e!449986 mapRes!22615))))

(declare-fun condMapEmpty!22615 () Bool)

(declare-fun mapDefault!22615 () ValueCell!6598)

