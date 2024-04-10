; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107262 () Bool)

(assert start!107262)

(declare-fun mapNonEmpty!51007 () Bool)

(declare-fun mapRes!51007 () Bool)

(declare-fun tp!97348 () Bool)

(declare-fun e!724965 () Bool)

(assert (=> mapNonEmpty!51007 (= mapRes!51007 (and tp!97348 e!724965))))

(declare-datatypes ((V!49127 0))(
  ( (V!49128 (val!16550 Int)) )
))
(declare-datatypes ((ValueCell!15622 0))(
  ( (ValueCellFull!15622 (v!19187 V!49127)) (EmptyCell!15622) )
))
(declare-fun mapRest!51007 () (Array (_ BitVec 32) ValueCell!15622))

(declare-fun mapValue!51007 () ValueCell!15622)

(declare-fun mapKey!51007 () (_ BitVec 32))

(declare-datatypes ((array!83152 0))(
  ( (array!83153 (arr!40113 (Array (_ BitVec 32) ValueCell!15622)) (size!40649 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83152)

(assert (=> mapNonEmpty!51007 (= (arr!40113 _values!1134) (store mapRest!51007 mapKey!51007 mapValue!51007))))

(declare-fun mapIsEmpty!51007 () Bool)

(assert (=> mapIsEmpty!51007 mapRes!51007))

(declare-fun b!1271381 () Bool)

(declare-fun e!724966 () Bool)

(declare-fun tp_is_empty!32951 () Bool)

(assert (=> b!1271381 (= e!724966 tp_is_empty!32951)))

(declare-fun res!845884 () Bool)

(declare-fun e!724964 () Bool)

(assert (=> start!107262 (=> (not res!845884) (not e!724964))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107262 (= res!845884 (validMask!0 mask!1730))))

(assert (=> start!107262 e!724964))

(declare-fun e!724968 () Bool)

(declare-fun array_inv!30511 (array!83152) Bool)

(assert (=> start!107262 (and (array_inv!30511 _values!1134) e!724968)))

(assert (=> start!107262 true))

(declare-datatypes ((array!83154 0))(
  ( (array!83155 (arr!40114 (Array (_ BitVec 32) (_ BitVec 64))) (size!40650 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83154)

(declare-fun array_inv!30512 (array!83154) Bool)

(assert (=> start!107262 (array_inv!30512 _keys!1364)))

(declare-fun b!1271382 () Bool)

(declare-fun res!845883 () Bool)

(assert (=> b!1271382 (=> (not res!845883) (not e!724964))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83154 (_ BitVec 32)) Bool)

(assert (=> b!1271382 (= res!845883 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1271383 () Bool)

(assert (=> b!1271383 (= e!724964 false)))

(declare-fun lt!574863 () Bool)

(declare-datatypes ((List!28522 0))(
  ( (Nil!28519) (Cons!28518 (h!29727 (_ BitVec 64)) (t!42051 List!28522)) )
))
(declare-fun arrayNoDuplicates!0 (array!83154 (_ BitVec 32) List!28522) Bool)

(assert (=> b!1271383 (= lt!574863 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28519))))

(declare-fun b!1271384 () Bool)

(declare-fun res!845885 () Bool)

(assert (=> b!1271384 (=> (not res!845885) (not e!724964))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1271384 (= res!845885 (and (= (size!40649 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40650 _keys!1364) (size!40649 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1271385 () Bool)

(assert (=> b!1271385 (= e!724965 tp_is_empty!32951)))

(declare-fun b!1271386 () Bool)

(assert (=> b!1271386 (= e!724968 (and e!724966 mapRes!51007))))

(declare-fun condMapEmpty!51007 () Bool)

(declare-fun mapDefault!51007 () ValueCell!15622)

