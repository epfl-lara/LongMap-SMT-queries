; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83502 () Bool)

(assert start!83502)

(declare-fun b_free!19507 () Bool)

(declare-fun b_next!19507 () Bool)

(assert (=> start!83502 (= b_free!19507 (not b_next!19507))))

(declare-fun tp!67810 () Bool)

(declare-fun b_and!31083 () Bool)

(assert (=> start!83502 (= tp!67810 b_and!31083)))

(declare-fun b!975529 () Bool)

(declare-fun res!653105 () Bool)

(declare-fun e!549774 () Bool)

(assert (=> b!975529 (=> (not res!653105) (not e!549774))))

(declare-datatypes ((array!60782 0))(
  ( (array!60783 (arr!29255 (Array (_ BitVec 32) (_ BitVec 64))) (size!29736 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60782)

(declare-datatypes ((List!20346 0))(
  ( (Nil!20343) (Cons!20342 (h!21504 (_ BitVec 64)) (t!28816 List!20346)) )
))
(declare-fun arrayNoDuplicates!0 (array!60782 (_ BitVec 32) List!20346) Bool)

(assert (=> b!975529 (= res!653105 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20343))))

(declare-fun b!975530 () Bool)

(declare-fun e!549769 () Bool)

(declare-fun tp_is_empty!22411 () Bool)

(assert (=> b!975530 (= e!549769 tp_is_empty!22411)))

(declare-fun b!975531 () Bool)

(declare-fun e!549772 () Bool)

(declare-fun from!2118 () (_ BitVec 32))

(assert (=> b!975531 (= e!549772 (not (bvslt (bvsub from!2118 #b00000000000000000000000000000001) (size!29736 _keys!1717))))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34865 0))(
  ( (V!34866 (val!11256 Int)) )
))
(declare-datatypes ((ValueCell!10724 0))(
  ( (ValueCellFull!10724 (v!13814 V!34865)) (EmptyCell!10724) )
))
(declare-datatypes ((array!60784 0))(
  ( (array!60785 (arr!29256 (Array (_ BitVec 32) ValueCell!10724)) (size!29737 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60784)

(declare-datatypes ((tuple2!14538 0))(
  ( (tuple2!14539 (_1!7280 (_ BitVec 64)) (_2!7280 V!34865)) )
))
(declare-datatypes ((List!20347 0))(
  ( (Nil!20344) (Cons!20343 (h!21505 tuple2!14538) (t!28817 List!20347)) )
))
(declare-datatypes ((ListLongMap!13225 0))(
  ( (ListLongMap!13226 (toList!6628 List!20347)) )
))
(declare-fun lt!432666 () ListLongMap!13225)

(declare-fun lt!432664 () (_ BitVec 64))

(declare-fun zeroValue!1367 () V!34865)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34865)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun +!2932 (ListLongMap!13225 tuple2!14538) ListLongMap!13225)

(declare-fun getCurrentListMap!3790 (array!60782 array!60784 (_ BitVec 32) (_ BitVec 32) V!34865 V!34865 (_ BitVec 32) Int) ListLongMap!13225)

(declare-fun get!15155 (ValueCell!10724 V!34865) V!34865)

(declare-fun dynLambda!1688 (Int (_ BitVec 64)) V!34865)

(assert (=> b!975531 (= lt!432666 (+!2932 (getCurrentListMap!3790 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) (tuple2!14539 lt!432664 (get!15155 (select (arr!29256 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1688 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!32316 0))(
  ( (Unit!32317) )
))
(declare-fun lt!432665 () Unit!32316)

(declare-fun lemmaListMapRecursiveValidKeyArray!272 (array!60782 array!60784 (_ BitVec 32) (_ BitVec 32) V!34865 V!34865 (_ BitVec 32) Int) Unit!32316)

(assert (=> b!975531 (= lt!432665 (lemmaListMapRecursiveValidKeyArray!272 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!975532 () Bool)

(declare-fun e!549773 () Bool)

(declare-fun e!549771 () Bool)

(declare-fun mapRes!35626 () Bool)

(assert (=> b!975532 (= e!549773 (and e!549771 mapRes!35626))))

(declare-fun condMapEmpty!35626 () Bool)

(declare-fun mapDefault!35626 () ValueCell!10724)

(assert (=> b!975532 (= condMapEmpty!35626 (= (arr!29256 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10724)) mapDefault!35626)))))

(declare-fun b!975534 () Bool)

(declare-fun res!653106 () Bool)

(assert (=> b!975534 (=> (not res!653106) (not e!549774))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60782 (_ BitVec 32)) Bool)

(assert (=> b!975534 (= res!653106 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!975535 () Bool)

(declare-fun res!653104 () Bool)

(assert (=> b!975535 (=> (not res!653104) (not e!549774))))

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!975535 (= res!653104 (validKeyInArray!0 (select (arr!29255 _keys!1717) i!822)))))

(declare-fun b!975536 () Bool)

(declare-fun res!653109 () Bool)

(assert (=> b!975536 (=> (not res!653109) (not e!549774))))

(assert (=> b!975536 (= res!653109 (and (= (size!29737 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29736 _keys!1717) (size!29737 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!35626 () Bool)

(declare-fun tp!67809 () Bool)

(assert (=> mapNonEmpty!35626 (= mapRes!35626 (and tp!67809 e!549769))))

(declare-fun mapKey!35626 () (_ BitVec 32))

(declare-fun mapValue!35626 () ValueCell!10724)

(declare-fun mapRest!35626 () (Array (_ BitVec 32) ValueCell!10724))

(assert (=> mapNonEmpty!35626 (= (arr!29256 _values!1425) (store mapRest!35626 mapKey!35626 mapValue!35626))))

(declare-fun b!975537 () Bool)

(assert (=> b!975537 (= e!549774 e!549772)))

(declare-fun res!653108 () Bool)

(assert (=> b!975537 (=> (not res!653108) (not e!549772))))

(assert (=> b!975537 (= res!653108 (validKeyInArray!0 lt!432664))))

(assert (=> b!975537 (= lt!432664 (select (arr!29255 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(assert (=> b!975537 (= lt!432666 (getCurrentListMap!3790 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!975538 () Bool)

(declare-fun res!653110 () Bool)

(assert (=> b!975538 (=> (not res!653110) (not e!549774))))

(assert (=> b!975538 (= res!653110 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29736 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29736 _keys!1717))))))

(declare-fun res!653107 () Bool)

(assert (=> start!83502 (=> (not res!653107) (not e!549774))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83502 (= res!653107 (validMask!0 mask!2147))))

(assert (=> start!83502 e!549774))

(assert (=> start!83502 true))

(declare-fun array_inv!22671 (array!60784) Bool)

(assert (=> start!83502 (and (array_inv!22671 _values!1425) e!549773)))

(assert (=> start!83502 tp_is_empty!22411))

(assert (=> start!83502 tp!67810))

(declare-fun array_inv!22672 (array!60782) Bool)

(assert (=> start!83502 (array_inv!22672 _keys!1717)))

(declare-fun b!975533 () Bool)

(assert (=> b!975533 (= e!549771 tp_is_empty!22411)))

(declare-fun b!975539 () Bool)

(declare-fun res!653103 () Bool)

(assert (=> b!975539 (=> (not res!653103) (not e!549774))))

(declare-fun contains!5659 (ListLongMap!13225 (_ BitVec 64)) Bool)

(assert (=> b!975539 (= res!653103 (contains!5659 (getCurrentListMap!3790 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29255 _keys!1717) i!822)))))

(declare-fun mapIsEmpty!35626 () Bool)

(assert (=> mapIsEmpty!35626 mapRes!35626))

(assert (= (and start!83502 res!653107) b!975536))

(assert (= (and b!975536 res!653109) b!975534))

(assert (= (and b!975534 res!653106) b!975529))

(assert (= (and b!975529 res!653105) b!975538))

(assert (= (and b!975538 res!653110) b!975535))

(assert (= (and b!975535 res!653104) b!975539))

(assert (= (and b!975539 res!653103) b!975537))

(assert (= (and b!975537 res!653108) b!975531))

(assert (= (and b!975532 condMapEmpty!35626) mapIsEmpty!35626))

(assert (= (and b!975532 (not condMapEmpty!35626)) mapNonEmpty!35626))

(get-info :version)

(assert (= (and mapNonEmpty!35626 ((_ is ValueCellFull!10724) mapValue!35626)) b!975530))

(assert (= (and b!975532 ((_ is ValueCellFull!10724) mapDefault!35626)) b!975533))

(assert (= start!83502 b!975532))

(declare-fun b_lambda!14527 () Bool)

(assert (=> (not b_lambda!14527) (not b!975531)))

(declare-fun t!28815 () Bool)

(declare-fun tb!6321 () Bool)

(assert (=> (and start!83502 (= defaultEntry!1428 defaultEntry!1428) t!28815) tb!6321))

(declare-fun result!12627 () Bool)

(assert (=> tb!6321 (= result!12627 tp_is_empty!22411)))

(assert (=> b!975531 t!28815))

(declare-fun b_and!31085 () Bool)

(assert (= b_and!31083 (and (=> t!28815 result!12627) b_and!31085)))

(declare-fun m!902171 () Bool)

(assert (=> b!975534 m!902171))

(declare-fun m!902173 () Bool)

(assert (=> b!975531 m!902173))

(declare-fun m!902175 () Bool)

(assert (=> b!975531 m!902175))

(declare-fun m!902177 () Bool)

(assert (=> b!975531 m!902177))

(assert (=> b!975531 m!902173))

(assert (=> b!975531 m!902177))

(declare-fun m!902179 () Bool)

(assert (=> b!975531 m!902179))

(assert (=> b!975531 m!902175))

(declare-fun m!902181 () Bool)

(assert (=> b!975531 m!902181))

(declare-fun m!902183 () Bool)

(assert (=> b!975531 m!902183))

(declare-fun m!902185 () Bool)

(assert (=> b!975539 m!902185))

(declare-fun m!902187 () Bool)

(assert (=> b!975539 m!902187))

(assert (=> b!975539 m!902185))

(assert (=> b!975539 m!902187))

(declare-fun m!902189 () Bool)

(assert (=> b!975539 m!902189))

(declare-fun m!902191 () Bool)

(assert (=> b!975537 m!902191))

(declare-fun m!902193 () Bool)

(assert (=> b!975537 m!902193))

(declare-fun m!902195 () Bool)

(assert (=> b!975537 m!902195))

(assert (=> b!975535 m!902187))

(assert (=> b!975535 m!902187))

(declare-fun m!902197 () Bool)

(assert (=> b!975535 m!902197))

(declare-fun m!902199 () Bool)

(assert (=> start!83502 m!902199))

(declare-fun m!902201 () Bool)

(assert (=> start!83502 m!902201))

(declare-fun m!902203 () Bool)

(assert (=> start!83502 m!902203))

(declare-fun m!902205 () Bool)

(assert (=> mapNonEmpty!35626 m!902205))

(declare-fun m!902207 () Bool)

(assert (=> b!975529 m!902207))

(check-sat (not start!83502) (not b!975534) (not mapNonEmpty!35626) (not b!975537) (not b_lambda!14527) b_and!31085 (not b_next!19507) (not b!975529) (not b!975531) tp_is_empty!22411 (not b!975535) (not b!975539))
(check-sat b_and!31085 (not b_next!19507))
