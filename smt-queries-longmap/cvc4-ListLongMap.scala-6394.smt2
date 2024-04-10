; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82164 () Bool)

(assert start!82164)

(declare-fun b!957635 () Bool)

(declare-fun res!641029 () Bool)

(declare-fun e!539847 () Bool)

(assert (=> b!957635 (=> (not res!641029) (not e!539847))))

(declare-datatypes ((array!58389 0))(
  ( (array!58390 (arr!28068 (Array (_ BitVec 32) (_ BitVec 64))) (size!28547 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58389)

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58389 (_ BitVec 32)) Bool)

(assert (=> b!957635 (= res!641029 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun res!641028 () Bool)

(assert (=> start!82164 (=> (not res!641028) (not e!539847))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82164 (= res!641028 (validMask!0 mask!2088))))

(assert (=> start!82164 e!539847))

(assert (=> start!82164 true))

(declare-datatypes ((V!33173 0))(
  ( (V!33174 (val!10622 Int)) )
))
(declare-datatypes ((ValueCell!10090 0))(
  ( (ValueCellFull!10090 (v!13179 V!33173)) (EmptyCell!10090) )
))
(declare-datatypes ((array!58391 0))(
  ( (array!58392 (arr!28069 (Array (_ BitVec 32) ValueCell!10090)) (size!28548 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58391)

(declare-fun e!539849 () Bool)

(declare-fun array_inv!21771 (array!58391) Bool)

(assert (=> start!82164 (and (array_inv!21771 _values!1386) e!539849)))

(declare-fun array_inv!21772 (array!58389) Bool)

(assert (=> start!82164 (array_inv!21772 _keys!1668)))

(declare-fun mapNonEmpty!33694 () Bool)

(declare-fun mapRes!33694 () Bool)

(declare-fun tp!64299 () Bool)

(declare-fun e!539850 () Bool)

(assert (=> mapNonEmpty!33694 (= mapRes!33694 (and tp!64299 e!539850))))

(declare-fun mapKey!33694 () (_ BitVec 32))

(declare-fun mapValue!33694 () ValueCell!10090)

(declare-fun mapRest!33694 () (Array (_ BitVec 32) ValueCell!10090))

(assert (=> mapNonEmpty!33694 (= (arr!28069 _values!1386) (store mapRest!33694 mapKey!33694 mapValue!33694))))

(declare-fun b!957636 () Bool)

(assert (=> b!957636 (= e!539847 false)))

(declare-fun lt!430356 () Bool)

(declare-datatypes ((List!19518 0))(
  ( (Nil!19515) (Cons!19514 (h!20676 (_ BitVec 64)) (t!27881 List!19518)) )
))
(declare-fun arrayNoDuplicates!0 (array!58389 (_ BitVec 32) List!19518) Bool)

(assert (=> b!957636 (= lt!430356 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19515))))

(declare-fun b!957637 () Bool)

(declare-fun res!641030 () Bool)

(assert (=> b!957637 (=> (not res!641030) (not e!539847))))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(assert (=> b!957637 (= res!641030 (and (= (size!28548 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28547 _keys!1668) (size!28548 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!957638 () Bool)

(declare-fun e!539846 () Bool)

(assert (=> b!957638 (= e!539849 (and e!539846 mapRes!33694))))

(declare-fun condMapEmpty!33694 () Bool)

(declare-fun mapDefault!33694 () ValueCell!10090)

