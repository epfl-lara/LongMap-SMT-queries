; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82900 () Bool)

(assert start!82900)

(declare-fun b_free!18865 () Bool)

(declare-fun b_next!18865 () Bool)

(assert (=> start!82900 (= b_free!18865 (not b_next!18865))))

(declare-fun tp!65715 () Bool)

(declare-fun b_and!30363 () Bool)

(assert (=> start!82900 (= tp!65715 b_and!30363)))

(declare-fun b!965825 () Bool)

(declare-fun res!646241 () Bool)

(declare-fun e!544537 () Bool)

(assert (=> b!965825 (=> (not res!646241) (not e!544537))))

(declare-datatypes ((array!59438 0))(
  ( (array!59439 (arr!28583 (Array (_ BitVec 32) (_ BitVec 64))) (size!29063 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59438)

(declare-datatypes ((List!19824 0))(
  ( (Nil!19821) (Cons!19820 (h!20988 (_ BitVec 64)) (t!28179 List!19824)) )
))
(declare-fun arrayNoDuplicates!0 (array!59438 (_ BitVec 32) List!19824) Bool)

(assert (=> b!965825 (= res!646241 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19821))))

(declare-fun res!646242 () Bool)

(assert (=> start!82900 (=> (not res!646242) (not e!544537))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82900 (= res!646242 (validMask!0 mask!2110))))

(assert (=> start!82900 e!544537))

(assert (=> start!82900 true))

(declare-datatypes ((V!33873 0))(
  ( (V!33874 (val!10884 Int)) )
))
(declare-datatypes ((ValueCell!10352 0))(
  ( (ValueCellFull!10352 (v!13439 V!33873)) (EmptyCell!10352) )
))
(declare-datatypes ((array!59440 0))(
  ( (array!59441 (arr!28584 (Array (_ BitVec 32) ValueCell!10352)) (size!29064 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59440)

(declare-fun e!544536 () Bool)

(declare-fun array_inv!22201 (array!59440) Bool)

(assert (=> start!82900 (and (array_inv!22201 _values!1400) e!544536)))

(declare-fun array_inv!22202 (array!59438) Bool)

(assert (=> start!82900 (array_inv!22202 _keys!1686)))

(assert (=> start!82900 tp!65715))

(declare-fun tp_is_empty!21667 () Bool)

(assert (=> start!82900 tp_is_empty!21667))

(declare-fun b!965826 () Bool)

(declare-fun e!544538 () Bool)

(declare-fun mapRes!34495 () Bool)

(assert (=> b!965826 (= e!544536 (and e!544538 mapRes!34495))))

(declare-fun condMapEmpty!34495 () Bool)

(declare-fun mapDefault!34495 () ValueCell!10352)

(assert (=> b!965826 (= condMapEmpty!34495 (= (arr!28584 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10352)) mapDefault!34495)))))

(declare-fun b!965827 () Bool)

(assert (=> b!965827 (= e!544538 tp_is_empty!21667)))

(declare-fun mapIsEmpty!34495 () Bool)

(assert (=> mapIsEmpty!34495 mapRes!34495))

(declare-fun b!965828 () Bool)

(declare-fun res!646237 () Bool)

(assert (=> b!965828 (=> (not res!646237) (not e!544537))))

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!965828 (= res!646237 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29063 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29063 _keys!1686))))))

(declare-fun b!965829 () Bool)

(declare-fun res!646238 () Bool)

(assert (=> b!965829 (=> (not res!646238) (not e!544537))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59438 (_ BitVec 32)) Bool)

(assert (=> b!965829 (= res!646238 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!965830 () Bool)

(declare-fun res!646239 () Bool)

(assert (=> b!965830 (=> (not res!646239) (not e!544537))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(assert (=> b!965830 (= res!646239 (and (= (size!29064 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29063 _keys!1686) (size!29064 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!965831 () Bool)

(declare-fun e!544535 () Bool)

(assert (=> b!965831 (= e!544535 tp_is_empty!21667)))

(declare-fun b!965832 () Bool)

(declare-fun res!646240 () Bool)

(assert (=> b!965832 (=> (not res!646240) (not e!544537))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!965832 (= res!646240 (validKeyInArray!0 (select (arr!28583 _keys!1686) i!803)))))

(declare-fun mapNonEmpty!34495 () Bool)

(declare-fun tp!65716 () Bool)

(assert (=> mapNonEmpty!34495 (= mapRes!34495 (and tp!65716 e!544535))))

(declare-fun mapRest!34495 () (Array (_ BitVec 32) ValueCell!10352))

(declare-fun mapKey!34495 () (_ BitVec 32))

(declare-fun mapValue!34495 () ValueCell!10352)

(assert (=> mapNonEmpty!34495 (= (arr!28584 _values!1400) (store mapRest!34495 mapKey!34495 mapValue!34495))))

(declare-fun b!965833 () Bool)

(assert (=> b!965833 (= e!544537 false)))

(declare-fun lt!431543 () Bool)

(declare-fun defaultEntry!1403 () Int)

(declare-fun minValue!1342 () V!33873)

(declare-fun zeroValue!1342 () V!33873)

(declare-datatypes ((tuple2!13978 0))(
  ( (tuple2!13979 (_1!7000 (_ BitVec 64)) (_2!7000 V!33873)) )
))
(declare-datatypes ((List!19825 0))(
  ( (Nil!19822) (Cons!19821 (h!20989 tuple2!13978) (t!28180 List!19825)) )
))
(declare-datatypes ((ListLongMap!12677 0))(
  ( (ListLongMap!12678 (toList!6354 List!19825)) )
))
(declare-fun contains!5469 (ListLongMap!12677 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3587 (array!59438 array!59440 (_ BitVec 32) (_ BitVec 32) V!33873 V!33873 (_ BitVec 32) Int) ListLongMap!12677)

(assert (=> b!965833 (= lt!431543 (contains!5469 (getCurrentListMap!3587 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28583 _keys!1686) i!803)))))

(assert (= (and start!82900 res!646242) b!965830))

(assert (= (and b!965830 res!646239) b!965829))

(assert (= (and b!965829 res!646238) b!965825))

(assert (= (and b!965825 res!646241) b!965828))

(assert (= (and b!965828 res!646237) b!965832))

(assert (= (and b!965832 res!646240) b!965833))

(assert (= (and b!965826 condMapEmpty!34495) mapIsEmpty!34495))

(assert (= (and b!965826 (not condMapEmpty!34495)) mapNonEmpty!34495))

(get-info :version)

(assert (= (and mapNonEmpty!34495 ((_ is ValueCellFull!10352) mapValue!34495)) b!965831))

(assert (= (and b!965826 ((_ is ValueCellFull!10352) mapDefault!34495)) b!965827))

(assert (= start!82900 b!965826))

(declare-fun m!895423 () Bool)

(assert (=> b!965832 m!895423))

(assert (=> b!965832 m!895423))

(declare-fun m!895425 () Bool)

(assert (=> b!965832 m!895425))

(declare-fun m!895427 () Bool)

(assert (=> start!82900 m!895427))

(declare-fun m!895429 () Bool)

(assert (=> start!82900 m!895429))

(declare-fun m!895431 () Bool)

(assert (=> start!82900 m!895431))

(declare-fun m!895433 () Bool)

(assert (=> b!965833 m!895433))

(assert (=> b!965833 m!895423))

(assert (=> b!965833 m!895433))

(assert (=> b!965833 m!895423))

(declare-fun m!895435 () Bool)

(assert (=> b!965833 m!895435))

(declare-fun m!895437 () Bool)

(assert (=> mapNonEmpty!34495 m!895437))

(declare-fun m!895439 () Bool)

(assert (=> b!965825 m!895439))

(declare-fun m!895441 () Bool)

(assert (=> b!965829 m!895441))

(check-sat (not b!965825) (not start!82900) (not b!965832) (not mapNonEmpty!34495) (not b_next!18865) (not b!965833) (not b!965829) tp_is_empty!21667 b_and!30363)
(check-sat b_and!30363 (not b_next!18865))
