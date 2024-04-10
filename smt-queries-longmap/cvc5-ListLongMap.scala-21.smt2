; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!548 () Bool)

(assert start!548)

(declare-fun b!3267 () Bool)

(declare-fun res!5095 () Bool)

(declare-fun e!1508 () Bool)

(assert (=> b!3267 (=> (not res!5095) (not e!1508))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((V!323 0))(
  ( (V!324 (val!60 Int)) )
))
(declare-datatypes ((ValueCell!38 0))(
  ( (ValueCellFull!38 (v!1147 V!323)) (EmptyCell!38) )
))
(declare-datatypes ((array!157 0))(
  ( (array!158 (arr!72 (Array (_ BitVec 32) ValueCell!38)) (size!134 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!157)

(declare-datatypes ((array!159 0))(
  ( (array!160 (arr!73 (Array (_ BitVec 32) (_ BitVec 64))) (size!135 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!159)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!3267 (= res!5095 (and (= (size!134 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!135 _keys!1806) (size!134 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!3268 () Bool)

(declare-fun res!5093 () Bool)

(assert (=> b!3268 (=> (not res!5093) (not e!1508))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!159 (_ BitVec 32)) Bool)

(assert (=> b!3268 (= res!5093 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!3269 () Bool)

(declare-fun e!1507 () Bool)

(declare-fun tp_is_empty!109 () Bool)

(assert (=> b!3269 (= e!1507 tp_is_empty!109)))

(declare-fun b!3270 () Bool)

(declare-fun e!1506 () Bool)

(assert (=> b!3270 (= e!1506 tp_is_empty!109)))

(declare-fun b!3271 () Bool)

(assert (=> b!3271 (= e!1508 false)))

(declare-fun lt!447 () Bool)

(declare-datatypes ((List!51 0))(
  ( (Nil!48) (Cons!47 (h!613 (_ BitVec 64)) (t!2178 List!51)) )
))
(declare-fun arrayNoDuplicates!0 (array!159 (_ BitVec 32) List!51) Bool)

(assert (=> b!3271 (= lt!447 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!48))))

(declare-fun mapIsEmpty!119 () Bool)

(declare-fun mapRes!119 () Bool)

(assert (=> mapIsEmpty!119 mapRes!119))

(declare-fun mapNonEmpty!119 () Bool)

(declare-fun tp!359 () Bool)

(assert (=> mapNonEmpty!119 (= mapRes!119 (and tp!359 e!1507))))

(declare-fun mapKey!119 () (_ BitVec 32))

(declare-fun mapRest!119 () (Array (_ BitVec 32) ValueCell!38))

(declare-fun mapValue!119 () ValueCell!38)

(assert (=> mapNonEmpty!119 (= (arr!72 _values!1492) (store mapRest!119 mapKey!119 mapValue!119))))

(declare-fun b!3272 () Bool)

(declare-fun e!1505 () Bool)

(assert (=> b!3272 (= e!1505 (and e!1506 mapRes!119))))

(declare-fun condMapEmpty!119 () Bool)

(declare-fun mapDefault!119 () ValueCell!38)

