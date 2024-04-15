; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133598 () Bool)

(assert start!133598)

(declare-fun b!1562375 () Bool)

(declare-fun e!870622 () Bool)

(assert (=> b!1562375 (= e!870622 false)))

(declare-fun lt!671480 () Bool)

(declare-datatypes ((array!104088 0))(
  ( (array!104089 (arr!50237 (Array (_ BitVec 32) (_ BitVec 64))) (size!50789 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104088)

(declare-datatypes ((List!36537 0))(
  ( (Nil!36534) (Cons!36533 (h!37980 (_ BitVec 64)) (t!51376 List!36537)) )
))
(declare-fun arrayNoDuplicates!0 (array!104088 (_ BitVec 32) List!36537) Bool)

(assert (=> b!1562375 (= lt!671480 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36534))))

(declare-fun mapIsEmpty!59472 () Bool)

(declare-fun mapRes!59472 () Bool)

(assert (=> mapIsEmpty!59472 mapRes!59472))

(declare-fun b!1562376 () Bool)

(declare-fun e!870623 () Bool)

(declare-fun tp_is_empty!38731 () Bool)

(assert (=> b!1562376 (= e!870623 tp_is_empty!38731)))

(declare-fun b!1562377 () Bool)

(declare-fun e!870621 () Bool)

(declare-fun e!870624 () Bool)

(assert (=> b!1562377 (= e!870621 (and e!870624 mapRes!59472))))

(declare-fun condMapEmpty!59472 () Bool)

(declare-datatypes ((V!59849 0))(
  ( (V!59850 (val!19449 Int)) )
))
(declare-datatypes ((ValueCell!18335 0))(
  ( (ValueCellFull!18335 (v!22197 V!59849)) (EmptyCell!18335) )
))
(declare-datatypes ((array!104090 0))(
  ( (array!104091 (arr!50238 (Array (_ BitVec 32) ValueCell!18335)) (size!50790 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104090)

(declare-fun mapDefault!59472 () ValueCell!18335)

(assert (=> b!1562377 (= condMapEmpty!59472 (= (arr!50238 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18335)) mapDefault!59472)))))

(declare-fun b!1562378 () Bool)

(assert (=> b!1562378 (= e!870624 tp_is_empty!38731)))

(declare-fun mapNonEmpty!59472 () Bool)

(declare-fun tp!113308 () Bool)

(assert (=> mapNonEmpty!59472 (= mapRes!59472 (and tp!113308 e!870623))))

(declare-fun mapRest!59472 () (Array (_ BitVec 32) ValueCell!18335))

(declare-fun mapValue!59472 () ValueCell!18335)

(declare-fun mapKey!59472 () (_ BitVec 32))

(assert (=> mapNonEmpty!59472 (= (arr!50238 _values!487) (store mapRest!59472 mapKey!59472 mapValue!59472))))

(declare-fun res!1068265 () Bool)

(assert (=> start!133598 (=> (not res!1068265) (not e!870622))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133598 (= res!1068265 (validMask!0 mask!947))))

(assert (=> start!133598 e!870622))

(assert (=> start!133598 true))

(declare-fun array_inv!39233 (array!104090) Bool)

(assert (=> start!133598 (and (array_inv!39233 _values!487) e!870621)))

(declare-fun array_inv!39234 (array!104088) Bool)

(assert (=> start!133598 (array_inv!39234 _keys!637)))

(declare-fun b!1562379 () Bool)

(declare-fun res!1068267 () Bool)

(assert (=> b!1562379 (=> (not res!1068267) (not e!870622))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104088 (_ BitVec 32)) Bool)

(assert (=> b!1562379 (= res!1068267 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1562380 () Bool)

(declare-fun res!1068266 () Bool)

(assert (=> b!1562380 (=> (not res!1068266) (not e!870622))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1562380 (= res!1068266 (and (= (size!50790 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50789 _keys!637) (size!50790 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(assert (= (and start!133598 res!1068265) b!1562380))

(assert (= (and b!1562380 res!1068266) b!1562379))

(assert (= (and b!1562379 res!1068267) b!1562375))

(assert (= (and b!1562377 condMapEmpty!59472) mapIsEmpty!59472))

(assert (= (and b!1562377 (not condMapEmpty!59472)) mapNonEmpty!59472))

(get-info :version)

(assert (= (and mapNonEmpty!59472 ((_ is ValueCellFull!18335) mapValue!59472)) b!1562376))

(assert (= (and b!1562377 ((_ is ValueCellFull!18335) mapDefault!59472)) b!1562378))

(assert (= start!133598 b!1562377))

(declare-fun m!1437561 () Bool)

(assert (=> b!1562375 m!1437561))

(declare-fun m!1437563 () Bool)

(assert (=> mapNonEmpty!59472 m!1437563))

(declare-fun m!1437565 () Bool)

(assert (=> start!133598 m!1437565))

(declare-fun m!1437567 () Bool)

(assert (=> start!133598 m!1437567))

(declare-fun m!1437569 () Bool)

(assert (=> start!133598 m!1437569))

(declare-fun m!1437571 () Bool)

(assert (=> b!1562379 m!1437571))

(check-sat tp_is_empty!38731 (not start!133598) (not b!1562375) (not mapNonEmpty!59472) (not b!1562379))
(check-sat)
