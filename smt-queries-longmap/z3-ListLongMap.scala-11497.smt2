; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133792 () Bool)

(assert start!133792)

(declare-fun b!1564430 () Bool)

(declare-fun res!1069515 () Bool)

(declare-fun e!871944 () Bool)

(assert (=> b!1564430 (=> (not res!1069515) (not e!871944))))

(declare-datatypes ((array!104420 0))(
  ( (array!104421 (arr!50401 (Array (_ BitVec 32) (_ BitVec 64))) (size!50951 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104420)

(declare-datatypes ((List!36567 0))(
  ( (Nil!36564) (Cons!36563 (h!38009 (_ BitVec 64)) (t!51414 List!36567)) )
))
(declare-fun arrayNoDuplicates!0 (array!104420 (_ BitVec 32) List!36567) Bool)

(assert (=> b!1564430 (= res!1069515 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36564))))

(declare-fun b!1564431 () Bool)

(declare-fun e!871943 () Bool)

(declare-fun e!871945 () Bool)

(declare-fun mapRes!59676 () Bool)

(assert (=> b!1564431 (= e!871943 (and e!871945 mapRes!59676))))

(declare-fun condMapEmpty!59676 () Bool)

(declare-datatypes ((V!60027 0))(
  ( (V!60028 (val!19516 Int)) )
))
(declare-datatypes ((ValueCell!18402 0))(
  ( (ValueCellFull!18402 (v!22268 V!60027)) (EmptyCell!18402) )
))
(declare-datatypes ((array!104422 0))(
  ( (array!104423 (arr!50402 (Array (_ BitVec 32) ValueCell!18402)) (size!50952 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104422)

(declare-fun mapDefault!59676 () ValueCell!18402)

(assert (=> b!1564431 (= condMapEmpty!59676 (= (arr!50402 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18402)) mapDefault!59676)))))

(declare-fun res!1069518 () Bool)

(assert (=> start!133792 (=> (not res!1069518) (not e!871944))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133792 (= res!1069518 (validMask!0 mask!947))))

(assert (=> start!133792 e!871944))

(assert (=> start!133792 true))

(declare-fun array_inv!39169 (array!104420) Bool)

(assert (=> start!133792 (array_inv!39169 _keys!637)))

(declare-fun array_inv!39170 (array!104422) Bool)

(assert (=> start!133792 (and (array_inv!39170 _values!487) e!871943)))

(declare-fun b!1564432 () Bool)

(declare-fun res!1069517 () Bool)

(assert (=> b!1564432 (=> (not res!1069517) (not e!871944))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1564432 (= res!1069517 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50951 _keys!637)) (bvsge from!782 (size!50951 _keys!637))))))

(declare-fun b!1564433 () Bool)

(declare-fun tp_is_empty!38865 () Bool)

(assert (=> b!1564433 (= e!871945 tp_is_empty!38865)))

(declare-fun b!1564434 () Bool)

(declare-fun res!1069514 () Bool)

(assert (=> b!1564434 (=> (not res!1069514) (not e!871944))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104420 (_ BitVec 32)) Bool)

(assert (=> b!1564434 (= res!1069514 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun mapIsEmpty!59676 () Bool)

(assert (=> mapIsEmpty!59676 mapRes!59676))

(declare-fun b!1564435 () Bool)

(declare-fun res!1069516 () Bool)

(assert (=> b!1564435 (=> (not res!1069516) (not e!871944))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1564435 (= res!1069516 (and (= (size!50952 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50951 _keys!637) (size!50952 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1564436 () Bool)

(assert (=> b!1564436 (= e!871944 false)))

(declare-fun lt!672039 () Bool)

(declare-datatypes ((tuple2!25180 0))(
  ( (tuple2!25181 (_1!12601 (_ BitVec 64)) (_2!12601 V!60027)) )
))
(declare-datatypes ((List!36568 0))(
  ( (Nil!36565) (Cons!36564 (h!38010 tuple2!25180) (t!51415 List!36568)) )
))
(declare-datatypes ((ListLongMap!22615 0))(
  ( (ListLongMap!22616 (toList!11323 List!36568)) )
))
(declare-fun contains!10314 (ListLongMap!22615 (_ BitVec 64)) Bool)

(assert (=> b!1564436 (= lt!672039 (contains!10314 (ListLongMap!22616 Nil!36565) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!59676 () Bool)

(declare-fun tp!113601 () Bool)

(declare-fun e!871941 () Bool)

(assert (=> mapNonEmpty!59676 (= mapRes!59676 (and tp!113601 e!871941))))

(declare-fun mapRest!59676 () (Array (_ BitVec 32) ValueCell!18402))

(declare-fun mapKey!59676 () (_ BitVec 32))

(declare-fun mapValue!59676 () ValueCell!18402)

(assert (=> mapNonEmpty!59676 (= (arr!50402 _values!487) (store mapRest!59676 mapKey!59676 mapValue!59676))))

(declare-fun b!1564437 () Bool)

(declare-fun res!1069513 () Bool)

(assert (=> b!1564437 (=> (not res!1069513) (not e!871944))))

(assert (=> b!1564437 (= res!1069513 (not (contains!10314 (ListLongMap!22616 Nil!36565) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1564438 () Bool)

(assert (=> b!1564438 (= e!871941 tp_is_empty!38865)))

(assert (= (and start!133792 res!1069518) b!1564435))

(assert (= (and b!1564435 res!1069516) b!1564434))

(assert (= (and b!1564434 res!1069514) b!1564430))

(assert (= (and b!1564430 res!1069515) b!1564432))

(assert (= (and b!1564432 res!1069517) b!1564437))

(assert (= (and b!1564437 res!1069513) b!1564436))

(assert (= (and b!1564431 condMapEmpty!59676) mapIsEmpty!59676))

(assert (= (and b!1564431 (not condMapEmpty!59676)) mapNonEmpty!59676))

(get-info :version)

(assert (= (and mapNonEmpty!59676 ((_ is ValueCellFull!18402) mapValue!59676)) b!1564438))

(assert (= (and b!1564431 ((_ is ValueCellFull!18402) mapDefault!59676)) b!1564433))

(assert (= start!133792 b!1564431))

(declare-fun m!1439627 () Bool)

(assert (=> b!1564430 m!1439627))

(declare-fun m!1439629 () Bool)

(assert (=> b!1564437 m!1439629))

(declare-fun m!1439631 () Bool)

(assert (=> b!1564436 m!1439631))

(declare-fun m!1439633 () Bool)

(assert (=> start!133792 m!1439633))

(declare-fun m!1439635 () Bool)

(assert (=> start!133792 m!1439635))

(declare-fun m!1439637 () Bool)

(assert (=> start!133792 m!1439637))

(declare-fun m!1439639 () Bool)

(assert (=> mapNonEmpty!59676 m!1439639))

(declare-fun m!1439641 () Bool)

(assert (=> b!1564434 m!1439641))

(check-sat (not start!133792) tp_is_empty!38865 (not mapNonEmpty!59676) (not b!1564434) (not b!1564437) (not b!1564436) (not b!1564430))
(check-sat)
