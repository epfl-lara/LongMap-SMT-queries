; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82176 () Bool)

(assert start!82176)

(declare-fun mapNonEmpty!33712 () Bool)

(declare-fun mapRes!33712 () Bool)

(declare-fun tp!64317 () Bool)

(declare-fun e!539940 () Bool)

(assert (=> mapNonEmpty!33712 (= mapRes!33712 (and tp!64317 e!539940))))

(declare-datatypes ((V!33189 0))(
  ( (V!33190 (val!10628 Int)) )
))
(declare-datatypes ((ValueCell!10096 0))(
  ( (ValueCellFull!10096 (v!13185 V!33189)) (EmptyCell!10096) )
))
(declare-datatypes ((array!58413 0))(
  ( (array!58414 (arr!28080 (Array (_ BitVec 32) ValueCell!10096)) (size!28559 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58413)

(declare-fun mapKey!33712 () (_ BitVec 32))

(declare-fun mapValue!33712 () ValueCell!10096)

(declare-fun mapRest!33712 () (Array (_ BitVec 32) ValueCell!10096))

(assert (=> mapNonEmpty!33712 (= (arr!28080 _values!1386) (store mapRest!33712 mapKey!33712 mapValue!33712))))

(declare-fun mapIsEmpty!33712 () Bool)

(assert (=> mapIsEmpty!33712 mapRes!33712))

(declare-fun b!957743 () Bool)

(declare-fun res!641084 () Bool)

(declare-fun e!539936 () Bool)

(assert (=> b!957743 (=> (not res!641084) (not e!539936))))

(declare-datatypes ((array!58415 0))(
  ( (array!58416 (arr!28081 (Array (_ BitVec 32) (_ BitVec 64))) (size!28560 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58415)

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58415 (_ BitVec 32)) Bool)

(assert (=> b!957743 (= res!641084 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun res!641082 () Bool)

(assert (=> start!82176 (=> (not res!641082) (not e!539936))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82176 (= res!641082 (validMask!0 mask!2088))))

(assert (=> start!82176 e!539936))

(assert (=> start!82176 true))

(declare-fun e!539938 () Bool)

(declare-fun array_inv!21779 (array!58413) Bool)

(assert (=> start!82176 (and (array_inv!21779 _values!1386) e!539938)))

(declare-fun array_inv!21780 (array!58415) Bool)

(assert (=> start!82176 (array_inv!21780 _keys!1668)))

(declare-fun b!957744 () Bool)

(declare-fun res!641083 () Bool)

(assert (=> b!957744 (=> (not res!641083) (not e!539936))))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(assert (=> b!957744 (= res!641083 (and (= (size!28559 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28560 _keys!1668) (size!28559 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!957745 () Bool)

(declare-fun tp_is_empty!21155 () Bool)

(assert (=> b!957745 (= e!539940 tp_is_empty!21155)))

(declare-fun b!957746 () Bool)

(assert (=> b!957746 (= e!539936 false)))

(declare-fun lt!430374 () Bool)

(declare-datatypes ((List!19522 0))(
  ( (Nil!19519) (Cons!19518 (h!20680 (_ BitVec 64)) (t!27885 List!19522)) )
))
(declare-fun arrayNoDuplicates!0 (array!58415 (_ BitVec 32) List!19522) Bool)

(assert (=> b!957746 (= lt!430374 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19519))))

(declare-fun b!957747 () Bool)

(declare-fun e!539939 () Bool)

(assert (=> b!957747 (= e!539938 (and e!539939 mapRes!33712))))

(declare-fun condMapEmpty!33712 () Bool)

(declare-fun mapDefault!33712 () ValueCell!10096)

