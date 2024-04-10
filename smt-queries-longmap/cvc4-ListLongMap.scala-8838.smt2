; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107256 () Bool)

(assert start!107256)

(declare-fun b!1271327 () Bool)

(declare-fun res!845858 () Bool)

(declare-fun e!724920 () Bool)

(assert (=> b!1271327 (=> (not res!845858) (not e!724920))))

(declare-datatypes ((V!49119 0))(
  ( (V!49120 (val!16547 Int)) )
))
(declare-datatypes ((ValueCell!15619 0))(
  ( (ValueCellFull!15619 (v!19184 V!49119)) (EmptyCell!15619) )
))
(declare-datatypes ((array!83140 0))(
  ( (array!83141 (arr!40107 (Array (_ BitVec 32) ValueCell!15619)) (size!40643 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83140)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-datatypes ((array!83142 0))(
  ( (array!83143 (arr!40108 (Array (_ BitVec 32) (_ BitVec 64))) (size!40644 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83142)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1271327 (= res!845858 (and (= (size!40643 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40644 _keys!1364) (size!40643 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!50998 () Bool)

(declare-fun mapRes!50998 () Bool)

(declare-fun tp!97339 () Bool)

(declare-fun e!724921 () Bool)

(assert (=> mapNonEmpty!50998 (= mapRes!50998 (and tp!97339 e!724921))))

(declare-fun mapRest!50998 () (Array (_ BitVec 32) ValueCell!15619))

(declare-fun mapValue!50998 () ValueCell!15619)

(declare-fun mapKey!50998 () (_ BitVec 32))

(assert (=> mapNonEmpty!50998 (= (arr!40107 _values!1134) (store mapRest!50998 mapKey!50998 mapValue!50998))))

(declare-fun res!845857 () Bool)

(assert (=> start!107256 (=> (not res!845857) (not e!724920))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107256 (= res!845857 (validMask!0 mask!1730))))

(assert (=> start!107256 e!724920))

(declare-fun e!724923 () Bool)

(declare-fun array_inv!30505 (array!83140) Bool)

(assert (=> start!107256 (and (array_inv!30505 _values!1134) e!724923)))

(assert (=> start!107256 true))

(declare-fun array_inv!30506 (array!83142) Bool)

(assert (=> start!107256 (array_inv!30506 _keys!1364)))

(declare-fun b!1271328 () Bool)

(declare-fun tp_is_empty!32945 () Bool)

(assert (=> b!1271328 (= e!724921 tp_is_empty!32945)))

(declare-fun b!1271329 () Bool)

(declare-fun res!845856 () Bool)

(assert (=> b!1271329 (=> (not res!845856) (not e!724920))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83142 (_ BitVec 32)) Bool)

(assert (=> b!1271329 (= res!845856 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1271330 () Bool)

(assert (=> b!1271330 (= e!724920 false)))

(declare-fun lt!574854 () Bool)

(declare-datatypes ((List!28519 0))(
  ( (Nil!28516) (Cons!28515 (h!29724 (_ BitVec 64)) (t!42048 List!28519)) )
))
(declare-fun arrayNoDuplicates!0 (array!83142 (_ BitVec 32) List!28519) Bool)

(assert (=> b!1271330 (= lt!574854 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28516))))

(declare-fun b!1271331 () Bool)

(declare-fun e!724922 () Bool)

(assert (=> b!1271331 (= e!724923 (and e!724922 mapRes!50998))))

(declare-fun condMapEmpty!50998 () Bool)

(declare-fun mapDefault!50998 () ValueCell!15619)

