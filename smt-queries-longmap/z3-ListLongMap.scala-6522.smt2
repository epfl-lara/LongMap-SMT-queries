; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82974 () Bool)

(assert start!82974)

(declare-fun mapNonEmpty!34858 () Bool)

(declare-fun mapRes!34858 () Bool)

(declare-fun tp!66426 () Bool)

(declare-fun e!545788 () Bool)

(assert (=> mapNonEmpty!34858 (= mapRes!34858 (and tp!66426 e!545788))))

(declare-fun mapKey!34858 () (_ BitVec 32))

(declare-datatypes ((V!34195 0))(
  ( (V!34196 (val!11005 Int)) )
))
(declare-datatypes ((ValueCell!10473 0))(
  ( (ValueCellFull!10473 (v!13563 V!34195)) (EmptyCell!10473) )
))
(declare-datatypes ((array!59887 0))(
  ( (array!59888 (arr!28812 (Array (_ BitVec 32) ValueCell!10473)) (size!29291 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!59887)

(declare-fun mapRest!34858 () (Array (_ BitVec 32) ValueCell!10473))

(declare-fun mapValue!34858 () ValueCell!10473)

(assert (=> mapNonEmpty!34858 (= (arr!28812 _values!1425) (store mapRest!34858 mapKey!34858 mapValue!34858))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!59889 0))(
  ( (array!59890 (arr!28813 (Array (_ BitVec 32) (_ BitVec 64))) (size!29292 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!59889)

(declare-fun b!968488 () Bool)

(declare-fun e!545786 () Bool)

(assert (=> b!968488 (= e!545786 (and (= (size!29291 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29292 _keys!1717) (size!29291 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011) (not (= (size!29292 _keys!1717) (bvadd #b00000000000000000000000000000001 mask!2147)))))))

(declare-fun b!968489 () Bool)

(declare-fun e!545787 () Bool)

(declare-fun tp_is_empty!21909 () Bool)

(assert (=> b!968489 (= e!545787 tp_is_empty!21909)))

(declare-fun b!968490 () Bool)

(declare-fun e!545789 () Bool)

(assert (=> b!968490 (= e!545789 (and e!545787 mapRes!34858))))

(declare-fun condMapEmpty!34858 () Bool)

(declare-fun mapDefault!34858 () ValueCell!10473)

(assert (=> b!968490 (= condMapEmpty!34858 (= (arr!28812 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10473)) mapDefault!34858)))))

(declare-fun mapIsEmpty!34858 () Bool)

(assert (=> mapIsEmpty!34858 mapRes!34858))

(declare-fun b!968491 () Bool)

(assert (=> b!968491 (= e!545788 tp_is_empty!21909)))

(declare-fun res!648370 () Bool)

(assert (=> start!82974 (=> (not res!648370) (not e!545786))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82974 (= res!648370 (validMask!0 mask!2147))))

(assert (=> start!82974 e!545786))

(assert (=> start!82974 true))

(declare-fun array_inv!22303 (array!59887) Bool)

(assert (=> start!82974 (and (array_inv!22303 _values!1425) e!545789)))

(declare-fun array_inv!22304 (array!59889) Bool)

(assert (=> start!82974 (array_inv!22304 _keys!1717)))

(assert (= (and start!82974 res!648370) b!968488))

(assert (= (and b!968490 condMapEmpty!34858) mapIsEmpty!34858))

(assert (= (and b!968490 (not condMapEmpty!34858)) mapNonEmpty!34858))

(get-info :version)

(assert (= (and mapNonEmpty!34858 ((_ is ValueCellFull!10473) mapValue!34858)) b!968491))

(assert (= (and b!968490 ((_ is ValueCellFull!10473) mapDefault!34858)) b!968489))

(assert (= start!82974 b!968490))

(declare-fun m!896831 () Bool)

(assert (=> mapNonEmpty!34858 m!896831))

(declare-fun m!896833 () Bool)

(assert (=> start!82974 m!896833))

(declare-fun m!896835 () Bool)

(assert (=> start!82974 m!896835))

(declare-fun m!896837 () Bool)

(assert (=> start!82974 m!896837))

(check-sat (not start!82974) (not mapNonEmpty!34858) tp_is_empty!21909)
(check-sat)
