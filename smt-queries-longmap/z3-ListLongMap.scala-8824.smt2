; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107168 () Bool)

(assert start!107168)

(declare-fun b!1270471 () Bool)

(declare-fun e!724233 () Bool)

(declare-fun tp_is_empty!32857 () Bool)

(assert (=> b!1270471 (= e!724233 tp_is_empty!32857)))

(declare-fun mapNonEmpty!50866 () Bool)

(declare-fun mapRes!50866 () Bool)

(declare-fun tp!97208 () Bool)

(assert (=> mapNonEmpty!50866 (= mapRes!50866 (and tp!97208 e!724233))))

(declare-datatypes ((V!49003 0))(
  ( (V!49004 (val!16503 Int)) )
))
(declare-datatypes ((ValueCell!15575 0))(
  ( (ValueCellFull!15575 (v!19139 V!49003)) (EmptyCell!15575) )
))
(declare-datatypes ((array!82885 0))(
  ( (array!82886 (arr!39980 (Array (_ BitVec 32) ValueCell!15575)) (size!40518 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82885)

(declare-fun mapKey!50866 () (_ BitVec 32))

(declare-fun mapRest!50866 () (Array (_ BitVec 32) ValueCell!15575))

(declare-fun mapValue!50866 () ValueCell!15575)

(assert (=> mapNonEmpty!50866 (= (arr!39980 _values!1134) (store mapRest!50866 mapKey!50866 mapValue!50866))))

(declare-fun mapIsEmpty!50866 () Bool)

(assert (=> mapIsEmpty!50866 mapRes!50866))

(declare-fun b!1270472 () Bool)

(declare-fun e!724230 () Bool)

(assert (=> b!1270472 (= e!724230 tp_is_empty!32857)))

(declare-fun b!1270473 () Bool)

(declare-fun e!724231 () Bool)

(assert (=> b!1270473 (= e!724231 false)))

(declare-fun lt!574544 () Bool)

(declare-datatypes ((array!82887 0))(
  ( (array!82888 (arr!39981 (Array (_ BitVec 32) (_ BitVec 64))) (size!40519 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82887)

(declare-datatypes ((List!28566 0))(
  ( (Nil!28563) (Cons!28562 (h!29771 (_ BitVec 64)) (t!42087 List!28566)) )
))
(declare-fun arrayNoDuplicates!0 (array!82887 (_ BitVec 32) List!28566) Bool)

(assert (=> b!1270473 (= lt!574544 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28563))))

(declare-fun b!1270475 () Bool)

(declare-fun res!845435 () Bool)

(assert (=> b!1270475 (=> (not res!845435) (not e!724231))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82887 (_ BitVec 32)) Bool)

(assert (=> b!1270475 (= res!845435 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1270476 () Bool)

(declare-fun res!845433 () Bool)

(assert (=> b!1270476 (=> (not res!845433) (not e!724231))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1270476 (= res!845433 (and (= (size!40518 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40519 _keys!1364) (size!40518 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1270474 () Bool)

(declare-fun e!724232 () Bool)

(assert (=> b!1270474 (= e!724232 (and e!724230 mapRes!50866))))

(declare-fun condMapEmpty!50866 () Bool)

(declare-fun mapDefault!50866 () ValueCell!15575)

(assert (=> b!1270474 (= condMapEmpty!50866 (= (arr!39980 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15575)) mapDefault!50866)))))

(declare-fun res!845434 () Bool)

(assert (=> start!107168 (=> (not res!845434) (not e!724231))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107168 (= res!845434 (validMask!0 mask!1730))))

(assert (=> start!107168 e!724231))

(declare-fun array_inv!30573 (array!82885) Bool)

(assert (=> start!107168 (and (array_inv!30573 _values!1134) e!724232)))

(assert (=> start!107168 true))

(declare-fun array_inv!30574 (array!82887) Bool)

(assert (=> start!107168 (array_inv!30574 _keys!1364)))

(assert (= (and start!107168 res!845434) b!1270476))

(assert (= (and b!1270476 res!845433) b!1270475))

(assert (= (and b!1270475 res!845435) b!1270473))

(assert (= (and b!1270474 condMapEmpty!50866) mapIsEmpty!50866))

(assert (= (and b!1270474 (not condMapEmpty!50866)) mapNonEmpty!50866))

(get-info :version)

(assert (= (and mapNonEmpty!50866 ((_ is ValueCellFull!15575) mapValue!50866)) b!1270471))

(assert (= (and b!1270474 ((_ is ValueCellFull!15575) mapDefault!50866)) b!1270472))

(assert (= start!107168 b!1270474))

(declare-fun m!1168287 () Bool)

(assert (=> mapNonEmpty!50866 m!1168287))

(declare-fun m!1168289 () Bool)

(assert (=> b!1270473 m!1168289))

(declare-fun m!1168291 () Bool)

(assert (=> b!1270475 m!1168291))

(declare-fun m!1168293 () Bool)

(assert (=> start!107168 m!1168293))

(declare-fun m!1168295 () Bool)

(assert (=> start!107168 m!1168295))

(declare-fun m!1168297 () Bool)

(assert (=> start!107168 m!1168297))

(check-sat (not start!107168) (not b!1270475) (not b!1270473) (not mapNonEmpty!50866) tp_is_empty!32857)
(check-sat)
