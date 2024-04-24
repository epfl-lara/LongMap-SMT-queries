; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83580 () Bool)

(assert start!83580)

(declare-fun b_free!19405 () Bool)

(declare-fun b_next!19405 () Bool)

(assert (=> start!83580 (= b_free!19405 (not b_next!19405))))

(declare-fun tp!67494 () Bool)

(declare-fun b_and!31017 () Bool)

(assert (=> start!83580 (= tp!67494 b_and!31017)))

(declare-fun b!975067 () Bool)

(declare-fun e!549672 () Bool)

(assert (=> b!975067 (= e!549672 false)))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34721 0))(
  ( (V!34722 (val!11202 Int)) )
))
(declare-datatypes ((tuple2!14402 0))(
  ( (tuple2!14403 (_1!7212 (_ BitVec 64)) (_2!7212 V!34721)) )
))
(declare-datatypes ((List!20247 0))(
  ( (Nil!20244) (Cons!20243 (h!21411 tuple2!14402) (t!28716 List!20247)) )
))
(declare-datatypes ((ListLongMap!13101 0))(
  ( (ListLongMap!13102 (toList!6566 List!20247)) )
))
(declare-fun lt!433104 () ListLongMap!13101)

(declare-datatypes ((ValueCell!10670 0))(
  ( (ValueCellFull!10670 (v!13758 V!34721)) (EmptyCell!10670) )
))
(declare-datatypes ((array!60678 0))(
  ( (array!60679 (arr!29198 (Array (_ BitVec 32) ValueCell!10670)) (size!29678 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60678)

(declare-fun zeroValue!1367 () V!34721)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34721)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60680 0))(
  ( (array!60681 (arr!29199 (Array (_ BitVec 32) (_ BitVec 64))) (size!29679 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60680)

(declare-fun getCurrentListMap!3799 (array!60680 array!60678 (_ BitVec 32) (_ BitVec 32) V!34721 V!34721 (_ BitVec 32) Int) ListLongMap!13101)

(assert (=> b!975067 (= lt!433104 (getCurrentListMap!3799 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!975068 () Bool)

(declare-fun res!652443 () Bool)

(assert (=> b!975068 (=> (not res!652443) (not e!549672))))

(assert (=> b!975068 (= res!652443 (and (= (size!29678 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29679 _keys!1717) (size!29678 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!35464 () Bool)

(declare-fun mapRes!35464 () Bool)

(assert (=> mapIsEmpty!35464 mapRes!35464))

(declare-fun b!975069 () Bool)

(declare-fun res!652441 () Bool)

(assert (=> b!975069 (=> (not res!652441) (not e!549672))))

(declare-fun i!822 () (_ BitVec 32))

(declare-fun contains!5671 (ListLongMap!13101 (_ BitVec 64)) Bool)

(assert (=> b!975069 (= res!652441 (contains!5671 (getCurrentListMap!3799 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29199 _keys!1717) i!822)))))

(declare-fun b!975070 () Bool)

(declare-fun res!652440 () Bool)

(assert (=> b!975070 (=> (not res!652440) (not e!549672))))

(assert (=> b!975070 (= res!652440 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29679 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29679 _keys!1717))))))

(declare-fun b!975071 () Bool)

(declare-fun e!549671 () Bool)

(declare-fun tp_is_empty!22303 () Bool)

(assert (=> b!975071 (= e!549671 tp_is_empty!22303)))

(declare-fun res!652439 () Bool)

(assert (=> start!83580 (=> (not res!652439) (not e!549672))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83580 (= res!652439 (validMask!0 mask!2147))))

(assert (=> start!83580 e!549672))

(assert (=> start!83580 true))

(declare-fun e!549670 () Bool)

(declare-fun array_inv!22637 (array!60678) Bool)

(assert (=> start!83580 (and (array_inv!22637 _values!1425) e!549670)))

(assert (=> start!83580 tp_is_empty!22303))

(assert (=> start!83580 tp!67494))

(declare-fun array_inv!22638 (array!60680) Bool)

(assert (=> start!83580 (array_inv!22638 _keys!1717)))

(declare-fun mapNonEmpty!35464 () Bool)

(declare-fun tp!67495 () Bool)

(declare-fun e!549673 () Bool)

(assert (=> mapNonEmpty!35464 (= mapRes!35464 (and tp!67495 e!549673))))

(declare-fun mapValue!35464 () ValueCell!10670)

(declare-fun mapRest!35464 () (Array (_ BitVec 32) ValueCell!10670))

(declare-fun mapKey!35464 () (_ BitVec 32))

(assert (=> mapNonEmpty!35464 (= (arr!29198 _values!1425) (store mapRest!35464 mapKey!35464 mapValue!35464))))

(declare-fun b!975072 () Bool)

(assert (=> b!975072 (= e!549673 tp_is_empty!22303)))

(declare-fun b!975073 () Bool)

(declare-fun res!652445 () Bool)

(assert (=> b!975073 (=> (not res!652445) (not e!549672))))

(declare-datatypes ((List!20248 0))(
  ( (Nil!20245) (Cons!20244 (h!21412 (_ BitVec 64)) (t!28717 List!20248)) )
))
(declare-fun arrayNoDuplicates!0 (array!60680 (_ BitVec 32) List!20248) Bool)

(assert (=> b!975073 (= res!652445 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20245))))

(declare-fun b!975074 () Bool)

(assert (=> b!975074 (= e!549670 (and e!549671 mapRes!35464))))

(declare-fun condMapEmpty!35464 () Bool)

(declare-fun mapDefault!35464 () ValueCell!10670)

(assert (=> b!975074 (= condMapEmpty!35464 (= (arr!29198 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10670)) mapDefault!35464)))))

(declare-fun b!975075 () Bool)

(declare-fun res!652444 () Bool)

(assert (=> b!975075 (=> (not res!652444) (not e!549672))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60680 (_ BitVec 32)) Bool)

(assert (=> b!975075 (= res!652444 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!975076 () Bool)

(declare-fun res!652442 () Bool)

(assert (=> b!975076 (=> (not res!652442) (not e!549672))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!975076 (= res!652442 (validKeyInArray!0 (select (arr!29199 _keys!1717) i!822)))))

(assert (= (and start!83580 res!652439) b!975068))

(assert (= (and b!975068 res!652443) b!975075))

(assert (= (and b!975075 res!652444) b!975073))

(assert (= (and b!975073 res!652445) b!975070))

(assert (= (and b!975070 res!652440) b!975076))

(assert (= (and b!975076 res!652442) b!975069))

(assert (= (and b!975069 res!652441) b!975067))

(assert (= (and b!975074 condMapEmpty!35464) mapIsEmpty!35464))

(assert (= (and b!975074 (not condMapEmpty!35464)) mapNonEmpty!35464))

(get-info :version)

(assert (= (and mapNonEmpty!35464 ((_ is ValueCellFull!10670) mapValue!35464)) b!975072))

(assert (= (and b!975074 ((_ is ValueCellFull!10670) mapDefault!35464)) b!975071))

(assert (= start!83580 b!975074))

(declare-fun m!903053 () Bool)

(assert (=> b!975073 m!903053))

(declare-fun m!903055 () Bool)

(assert (=> start!83580 m!903055))

(declare-fun m!903057 () Bool)

(assert (=> start!83580 m!903057))

(declare-fun m!903059 () Bool)

(assert (=> start!83580 m!903059))

(declare-fun m!903061 () Bool)

(assert (=> b!975076 m!903061))

(assert (=> b!975076 m!903061))

(declare-fun m!903063 () Bool)

(assert (=> b!975076 m!903063))

(declare-fun m!903065 () Bool)

(assert (=> b!975067 m!903065))

(declare-fun m!903067 () Bool)

(assert (=> b!975069 m!903067))

(assert (=> b!975069 m!903061))

(assert (=> b!975069 m!903067))

(assert (=> b!975069 m!903061))

(declare-fun m!903069 () Bool)

(assert (=> b!975069 m!903069))

(declare-fun m!903071 () Bool)

(assert (=> mapNonEmpty!35464 m!903071))

(declare-fun m!903073 () Bool)

(assert (=> b!975075 m!903073))

(check-sat b_and!31017 (not b_next!19405) tp_is_empty!22303 (not start!83580) (not b!975075) (not b!975067) (not b!975076) (not b!975073) (not mapNonEmpty!35464) (not b!975069))
(check-sat b_and!31017 (not b_next!19405))
