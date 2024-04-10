; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107154 () Bool)

(assert start!107154)

(declare-fun b!1270409 () Bool)

(declare-fun e!724154 () Bool)

(declare-fun tp_is_empty!32843 () Bool)

(assert (=> b!1270409 (= e!724154 tp_is_empty!32843)))

(declare-fun b!1270410 () Bool)

(declare-fun e!724157 () Bool)

(assert (=> b!1270410 (= e!724157 false)))

(declare-fun lt!574701 () Bool)

(declare-datatypes ((array!82948 0))(
  ( (array!82949 (arr!40011 (Array (_ BitVec 32) (_ BitVec 64))) (size!40547 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82948)

(declare-datatypes ((List!28487 0))(
  ( (Nil!28484) (Cons!28483 (h!29692 (_ BitVec 64)) (t!42016 List!28487)) )
))
(declare-fun arrayNoDuplicates!0 (array!82948 (_ BitVec 32) List!28487) Bool)

(assert (=> b!1270410 (= lt!574701 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28484))))

(declare-fun res!845397 () Bool)

(assert (=> start!107154 (=> (not res!845397) (not e!724157))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107154 (= res!845397 (validMask!0 mask!1730))))

(assert (=> start!107154 e!724157))

(declare-datatypes ((V!48983 0))(
  ( (V!48984 (val!16496 Int)) )
))
(declare-datatypes ((ValueCell!15568 0))(
  ( (ValueCellFull!15568 (v!19133 V!48983)) (EmptyCell!15568) )
))
(declare-datatypes ((array!82950 0))(
  ( (array!82951 (arr!40012 (Array (_ BitVec 32) ValueCell!15568)) (size!40548 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82950)

(declare-fun e!724158 () Bool)

(declare-fun array_inv!30433 (array!82950) Bool)

(assert (=> start!107154 (and (array_inv!30433 _values!1134) e!724158)))

(assert (=> start!107154 true))

(declare-fun array_inv!30434 (array!82948) Bool)

(assert (=> start!107154 (array_inv!30434 _keys!1364)))

(declare-fun b!1270411 () Bool)

(declare-fun res!845399 () Bool)

(assert (=> b!1270411 (=> (not res!845399) (not e!724157))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1270411 (= res!845399 (and (= (size!40548 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40547 _keys!1364) (size!40548 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1270412 () Bool)

(declare-fun res!845398 () Bool)

(assert (=> b!1270412 (=> (not res!845398) (not e!724157))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82948 (_ BitVec 32)) Bool)

(assert (=> b!1270412 (= res!845398 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun mapNonEmpty!50845 () Bool)

(declare-fun mapRes!50845 () Bool)

(declare-fun tp!97186 () Bool)

(assert (=> mapNonEmpty!50845 (= mapRes!50845 (and tp!97186 e!724154))))

(declare-fun mapValue!50845 () ValueCell!15568)

(declare-fun mapKey!50845 () (_ BitVec 32))

(declare-fun mapRest!50845 () (Array (_ BitVec 32) ValueCell!15568))

(assert (=> mapNonEmpty!50845 (= (arr!40012 _values!1134) (store mapRest!50845 mapKey!50845 mapValue!50845))))

(declare-fun b!1270413 () Bool)

(declare-fun e!724156 () Bool)

(assert (=> b!1270413 (= e!724156 tp_is_empty!32843)))

(declare-fun mapIsEmpty!50845 () Bool)

(assert (=> mapIsEmpty!50845 mapRes!50845))

(declare-fun b!1270414 () Bool)

(assert (=> b!1270414 (= e!724158 (and e!724156 mapRes!50845))))

(declare-fun condMapEmpty!50845 () Bool)

(declare-fun mapDefault!50845 () ValueCell!15568)

