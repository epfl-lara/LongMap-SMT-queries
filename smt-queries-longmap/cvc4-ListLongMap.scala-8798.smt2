; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107016 () Bool)

(assert start!107016)

(declare-fun b!1268843 () Bool)

(declare-fun res!844452 () Bool)

(declare-fun e!723120 () Bool)

(assert (=> b!1268843 (=> (not res!844452) (not e!723120))))

(declare-datatypes ((V!48799 0))(
  ( (V!48800 (val!16427 Int)) )
))
(declare-datatypes ((ValueCell!15499 0))(
  ( (ValueCellFull!15499 (v!19064 V!48799)) (EmptyCell!15499) )
))
(declare-datatypes ((array!82680 0))(
  ( (array!82681 (arr!39877 (Array (_ BitVec 32) ValueCell!15499)) (size!40413 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82680)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-datatypes ((array!82682 0))(
  ( (array!82683 (arr!39878 (Array (_ BitVec 32) (_ BitVec 64))) (size!40414 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82682)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1268843 (= res!844452 (and (= (size!40413 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40414 _keys!1364) (size!40413 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun res!844453 () Bool)

(assert (=> start!107016 (=> (not res!844453) (not e!723120))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107016 (= res!844453 (validMask!0 mask!1730))))

(assert (=> start!107016 e!723120))

(declare-fun e!723122 () Bool)

(declare-fun array_inv!30343 (array!82680) Bool)

(assert (=> start!107016 (and (array_inv!30343 _values!1134) e!723122)))

(assert (=> start!107016 true))

(declare-fun array_inv!30344 (array!82682) Bool)

(assert (=> start!107016 (array_inv!30344 _keys!1364)))

(declare-fun mapIsEmpty!50638 () Bool)

(declare-fun mapRes!50638 () Bool)

(assert (=> mapIsEmpty!50638 mapRes!50638))

(declare-fun b!1268844 () Bool)

(declare-fun e!723119 () Bool)

(declare-fun tp_is_empty!32705 () Bool)

(assert (=> b!1268844 (= e!723119 tp_is_empty!32705)))

(declare-fun mapNonEmpty!50638 () Bool)

(declare-fun tp!96817 () Bool)

(assert (=> mapNonEmpty!50638 (= mapRes!50638 (and tp!96817 e!723119))))

(declare-fun mapKey!50638 () (_ BitVec 32))

(declare-fun mapRest!50638 () (Array (_ BitVec 32) ValueCell!15499))

(declare-fun mapValue!50638 () ValueCell!15499)

(assert (=> mapNonEmpty!50638 (= (arr!39877 _values!1134) (store mapRest!50638 mapKey!50638 mapValue!50638))))

(declare-fun b!1268845 () Bool)

(assert (=> b!1268845 (= e!723120 false)))

(declare-fun lt!574494 () Bool)

(declare-datatypes ((List!28397 0))(
  ( (Nil!28394) (Cons!28393 (h!29602 (_ BitVec 64)) (t!41926 List!28397)) )
))
(declare-fun arrayNoDuplicates!0 (array!82682 (_ BitVec 32) List!28397) Bool)

(assert (=> b!1268845 (= lt!574494 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28394))))

(declare-fun b!1268846 () Bool)

(declare-fun res!844454 () Bool)

(assert (=> b!1268846 (=> (not res!844454) (not e!723120))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82682 (_ BitVec 32)) Bool)

(assert (=> b!1268846 (= res!844454 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1268847 () Bool)

(declare-fun e!723123 () Bool)

(assert (=> b!1268847 (= e!723123 tp_is_empty!32705)))

(declare-fun b!1268848 () Bool)

(assert (=> b!1268848 (= e!723122 (and e!723123 mapRes!50638))))

(declare-fun condMapEmpty!50638 () Bool)

(declare-fun mapDefault!50638 () ValueCell!15499)

