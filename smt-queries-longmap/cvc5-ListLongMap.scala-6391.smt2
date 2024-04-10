; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82142 () Bool)

(assert start!82142)

(declare-fun mapNonEmpty!33661 () Bool)

(declare-fun mapRes!33661 () Bool)

(declare-fun tp!64266 () Bool)

(declare-fun e!539681 () Bool)

(assert (=> mapNonEmpty!33661 (= mapRes!33661 (and tp!64266 e!539681))))

(declare-datatypes ((V!33145 0))(
  ( (V!33146 (val!10611 Int)) )
))
(declare-datatypes ((ValueCell!10079 0))(
  ( (ValueCellFull!10079 (v!13168 V!33145)) (EmptyCell!10079) )
))
(declare-fun mapValue!33661 () ValueCell!10079)

(declare-fun mapRest!33661 () (Array (_ BitVec 32) ValueCell!10079))

(declare-datatypes ((array!58347 0))(
  ( (array!58348 (arr!28047 (Array (_ BitVec 32) ValueCell!10079)) (size!28526 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58347)

(declare-fun mapKey!33661 () (_ BitVec 32))

(assert (=> mapNonEmpty!33661 (= (arr!28047 _values!1386) (store mapRest!33661 mapKey!33661 mapValue!33661))))

(declare-fun b!957437 () Bool)

(declare-fun e!539685 () Bool)

(assert (=> b!957437 (= e!539685 false)))

(declare-fun lt!430323 () Bool)

(declare-datatypes ((array!58349 0))(
  ( (array!58350 (arr!28048 (Array (_ BitVec 32) (_ BitVec 64))) (size!28527 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58349)

(declare-datatypes ((List!19510 0))(
  ( (Nil!19507) (Cons!19506 (h!20668 (_ BitVec 64)) (t!27873 List!19510)) )
))
(declare-fun arrayNoDuplicates!0 (array!58349 (_ BitVec 32) List!19510) Bool)

(assert (=> b!957437 (= lt!430323 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19507))))

(declare-fun b!957438 () Bool)

(declare-fun e!539683 () Bool)

(declare-fun tp_is_empty!21121 () Bool)

(assert (=> b!957438 (= e!539683 tp_is_empty!21121)))

(declare-fun res!640930 () Bool)

(assert (=> start!82142 (=> (not res!640930) (not e!539685))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82142 (= res!640930 (validMask!0 mask!2088))))

(assert (=> start!82142 e!539685))

(assert (=> start!82142 true))

(declare-fun e!539684 () Bool)

(declare-fun array_inv!21757 (array!58347) Bool)

(assert (=> start!82142 (and (array_inv!21757 _values!1386) e!539684)))

(declare-fun array_inv!21758 (array!58349) Bool)

(assert (=> start!82142 (array_inv!21758 _keys!1668)))

(declare-fun b!957439 () Bool)

(assert (=> b!957439 (= e!539681 tp_is_empty!21121)))

(declare-fun b!957440 () Bool)

(declare-fun res!640929 () Bool)

(assert (=> b!957440 (=> (not res!640929) (not e!539685))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58349 (_ BitVec 32)) Bool)

(assert (=> b!957440 (= res!640929 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!957441 () Bool)

(declare-fun res!640931 () Bool)

(assert (=> b!957441 (=> (not res!640931) (not e!539685))))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(assert (=> b!957441 (= res!640931 (and (= (size!28526 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28527 _keys!1668) (size!28526 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!957442 () Bool)

(assert (=> b!957442 (= e!539684 (and e!539683 mapRes!33661))))

(declare-fun condMapEmpty!33661 () Bool)

(declare-fun mapDefault!33661 () ValueCell!10079)

