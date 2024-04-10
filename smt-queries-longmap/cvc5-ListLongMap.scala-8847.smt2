; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107306 () Bool)

(assert start!107306)

(declare-fun mapIsEmpty!51073 () Bool)

(declare-fun mapRes!51073 () Bool)

(assert (=> mapIsEmpty!51073 mapRes!51073))

(declare-fun b!1271777 () Bool)

(declare-fun e!725294 () Bool)

(declare-fun tp_is_empty!32995 () Bool)

(assert (=> b!1271777 (= e!725294 tp_is_empty!32995)))

(declare-fun b!1271778 () Bool)

(declare-fun res!846082 () Bool)

(declare-fun e!725296 () Bool)

(assert (=> b!1271778 (=> (not res!846082) (not e!725296))))

(declare-datatypes ((array!83238 0))(
  ( (array!83239 (arr!40156 (Array (_ BitVec 32) (_ BitVec 64))) (size!40692 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83238)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83238 (_ BitVec 32)) Bool)

(assert (=> b!1271778 (= res!846082 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1271779 () Bool)

(assert (=> b!1271779 (= e!725296 false)))

(declare-fun lt!574929 () Bool)

(declare-datatypes ((List!28538 0))(
  ( (Nil!28535) (Cons!28534 (h!29743 (_ BitVec 64)) (t!42067 List!28538)) )
))
(declare-fun arrayNoDuplicates!0 (array!83238 (_ BitVec 32) List!28538) Bool)

(assert (=> b!1271779 (= lt!574929 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28535))))

(declare-fun b!1271780 () Bool)

(declare-fun res!846081 () Bool)

(assert (=> b!1271780 (=> (not res!846081) (not e!725296))))

(declare-datatypes ((V!49187 0))(
  ( (V!49188 (val!16572 Int)) )
))
(declare-datatypes ((ValueCell!15644 0))(
  ( (ValueCellFull!15644 (v!19209 V!49187)) (EmptyCell!15644) )
))
(declare-datatypes ((array!83240 0))(
  ( (array!83241 (arr!40157 (Array (_ BitVec 32) ValueCell!15644)) (size!40693 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83240)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1271780 (= res!846081 (and (= (size!40693 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40692 _keys!1364) (size!40693 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun res!846083 () Bool)

(assert (=> start!107306 (=> (not res!846083) (not e!725296))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107306 (= res!846083 (validMask!0 mask!1730))))

(assert (=> start!107306 e!725296))

(declare-fun e!725298 () Bool)

(declare-fun array_inv!30545 (array!83240) Bool)

(assert (=> start!107306 (and (array_inv!30545 _values!1134) e!725298)))

(assert (=> start!107306 true))

(declare-fun array_inv!30546 (array!83238) Bool)

(assert (=> start!107306 (array_inv!30546 _keys!1364)))

(declare-fun b!1271781 () Bool)

(declare-fun e!725295 () Bool)

(assert (=> b!1271781 (= e!725295 tp_is_empty!32995)))

(declare-fun mapNonEmpty!51073 () Bool)

(declare-fun tp!97414 () Bool)

(assert (=> mapNonEmpty!51073 (= mapRes!51073 (and tp!97414 e!725294))))

(declare-fun mapValue!51073 () ValueCell!15644)

(declare-fun mapRest!51073 () (Array (_ BitVec 32) ValueCell!15644))

(declare-fun mapKey!51073 () (_ BitVec 32))

(assert (=> mapNonEmpty!51073 (= (arr!40157 _values!1134) (store mapRest!51073 mapKey!51073 mapValue!51073))))

(declare-fun b!1271782 () Bool)

(assert (=> b!1271782 (= e!725298 (and e!725295 mapRes!51073))))

(declare-fun condMapEmpty!51073 () Bool)

(declare-fun mapDefault!51073 () ValueCell!15644)

