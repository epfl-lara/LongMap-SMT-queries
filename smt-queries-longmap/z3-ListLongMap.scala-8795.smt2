; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106994 () Bool)

(assert start!106994)

(declare-fun b!1268581 () Bool)

(declare-fun e!722925 () Bool)

(assert (=> b!1268581 (= e!722925 false)))

(declare-fun lt!574283 () Bool)

(declare-datatypes ((array!82557 0))(
  ( (array!82558 (arr!39816 (Array (_ BitVec 32) (_ BitVec 64))) (size!40354 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82557)

(declare-datatypes ((List!28475 0))(
  ( (Nil!28472) (Cons!28471 (h!29680 (_ BitVec 64)) (t!41996 List!28475)) )
))
(declare-fun arrayNoDuplicates!0 (array!82557 (_ BitVec 32) List!28475) Bool)

(assert (=> b!1268581 (= lt!574283 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28472))))

(declare-fun res!844328 () Bool)

(assert (=> start!106994 (=> (not res!844328) (not e!722925))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106994 (= res!844328 (validMask!0 mask!1730))))

(assert (=> start!106994 e!722925))

(declare-datatypes ((V!48771 0))(
  ( (V!48772 (val!16416 Int)) )
))
(declare-datatypes ((ValueCell!15488 0))(
  ( (ValueCellFull!15488 (v!19052 V!48771)) (EmptyCell!15488) )
))
(declare-datatypes ((array!82559 0))(
  ( (array!82560 (arr!39817 (Array (_ BitVec 32) ValueCell!15488)) (size!40355 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82559)

(declare-fun e!722929 () Bool)

(declare-fun array_inv!30463 (array!82559) Bool)

(assert (=> start!106994 (and (array_inv!30463 _values!1134) e!722929)))

(assert (=> start!106994 true))

(declare-fun array_inv!30464 (array!82557) Bool)

(assert (=> start!106994 (array_inv!30464 _keys!1364)))

(declare-fun b!1268582 () Bool)

(declare-fun e!722928 () Bool)

(declare-fun tp_is_empty!32683 () Bool)

(assert (=> b!1268582 (= e!722928 tp_is_empty!32683)))

(declare-fun b!1268583 () Bool)

(declare-fun mapRes!50605 () Bool)

(assert (=> b!1268583 (= e!722929 (and e!722928 mapRes!50605))))

(declare-fun condMapEmpty!50605 () Bool)

(declare-fun mapDefault!50605 () ValueCell!15488)

(assert (=> b!1268583 (= condMapEmpty!50605 (= (arr!39817 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15488)) mapDefault!50605)))))

(declare-fun mapIsEmpty!50605 () Bool)

(assert (=> mapIsEmpty!50605 mapRes!50605))

(declare-fun b!1268584 () Bool)

(declare-fun res!844326 () Bool)

(assert (=> b!1268584 (=> (not res!844326) (not e!722925))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82557 (_ BitVec 32)) Bool)

(assert (=> b!1268584 (= res!844326 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1268585 () Bool)

(declare-fun res!844327 () Bool)

(assert (=> b!1268585 (=> (not res!844327) (not e!722925))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1268585 (= res!844327 (and (= (size!40355 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40354 _keys!1364) (size!40355 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!50605 () Bool)

(declare-fun tp!96785 () Bool)

(declare-fun e!722926 () Bool)

(assert (=> mapNonEmpty!50605 (= mapRes!50605 (and tp!96785 e!722926))))

(declare-fun mapKey!50605 () (_ BitVec 32))

(declare-fun mapRest!50605 () (Array (_ BitVec 32) ValueCell!15488))

(declare-fun mapValue!50605 () ValueCell!15488)

(assert (=> mapNonEmpty!50605 (= (arr!39817 _values!1134) (store mapRest!50605 mapKey!50605 mapValue!50605))))

(declare-fun b!1268586 () Bool)

(assert (=> b!1268586 (= e!722926 tp_is_empty!32683)))

(assert (= (and start!106994 res!844328) b!1268585))

(assert (= (and b!1268585 res!844327) b!1268584))

(assert (= (and b!1268584 res!844326) b!1268581))

(assert (= (and b!1268583 condMapEmpty!50605) mapIsEmpty!50605))

(assert (= (and b!1268583 (not condMapEmpty!50605)) mapNonEmpty!50605))

(get-info :version)

(assert (= (and mapNonEmpty!50605 ((_ is ValueCellFull!15488) mapValue!50605)) b!1268586))

(assert (= (and b!1268583 ((_ is ValueCellFull!15488) mapDefault!50605)) b!1268582))

(assert (= start!106994 b!1268583))

(declare-fun m!1166919 () Bool)

(assert (=> b!1268581 m!1166919))

(declare-fun m!1166921 () Bool)

(assert (=> start!106994 m!1166921))

(declare-fun m!1166923 () Bool)

(assert (=> start!106994 m!1166923))

(declare-fun m!1166925 () Bool)

(assert (=> start!106994 m!1166925))

(declare-fun m!1166927 () Bool)

(assert (=> b!1268584 m!1166927))

(declare-fun m!1166929 () Bool)

(assert (=> mapNonEmpty!50605 m!1166929))

(check-sat (not mapNonEmpty!50605) tp_is_empty!32683 (not b!1268581) (not start!106994) (not b!1268584))
(check-sat)
