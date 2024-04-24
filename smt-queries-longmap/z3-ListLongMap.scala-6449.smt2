; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82702 () Bool)

(assert start!82702)

(declare-fun b!962693 () Bool)

(declare-fun e!542970 () Bool)

(declare-fun e!542969 () Bool)

(declare-fun mapRes!34198 () Bool)

(assert (=> b!962693 (= e!542970 (and e!542969 mapRes!34198))))

(declare-fun condMapEmpty!34198 () Bool)

(declare-datatypes ((V!33609 0))(
  ( (V!33610 (val!10785 Int)) )
))
(declare-datatypes ((ValueCell!10253 0))(
  ( (ValueCellFull!10253 (v!13340 V!33609)) (EmptyCell!10253) )
))
(declare-datatypes ((array!59056 0))(
  ( (array!59057 (arr!28392 (Array (_ BitVec 32) ValueCell!10253)) (size!28872 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59056)

(declare-fun mapDefault!34198 () ValueCell!10253)

(assert (=> b!962693 (= condMapEmpty!34198 (= (arr!28392 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10253)) mapDefault!34198)))))

(declare-fun b!962694 () Bool)

(declare-fun e!542971 () Bool)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((array!59058 0))(
  ( (array!59059 (arr!28393 (Array (_ BitVec 32) (_ BitVec 64))) (size!28873 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59058)

(assert (=> b!962694 (= e!542971 (bvsgt from!2084 (size!28873 _keys!1686)))))

(declare-fun b!962695 () Bool)

(declare-fun e!542972 () Bool)

(declare-fun tp_is_empty!21469 () Bool)

(assert (=> b!962695 (= e!542972 tp_is_empty!21469)))

(declare-fun b!962696 () Bool)

(declare-fun res!643998 () Bool)

(assert (=> b!962696 (=> (not res!643998) (not e!542971))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59058 (_ BitVec 32)) Bool)

(assert (=> b!962696 (= res!643998 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!962697 () Bool)

(declare-fun res!643996 () Bool)

(assert (=> b!962697 (=> (not res!643996) (not e!542971))))

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!962697 (= res!643996 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28873 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28873 _keys!1686))))))

(declare-fun res!644000 () Bool)

(assert (=> start!82702 (=> (not res!644000) (not e!542971))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82702 (= res!644000 (validMask!0 mask!2110))))

(assert (=> start!82702 e!542971))

(assert (=> start!82702 true))

(declare-fun array_inv!22075 (array!59056) Bool)

(assert (=> start!82702 (and (array_inv!22075 _values!1400) e!542970)))

(declare-fun array_inv!22076 (array!59058) Bool)

(assert (=> start!82702 (array_inv!22076 _keys!1686)))

(declare-fun b!962698 () Bool)

(assert (=> b!962698 (= e!542969 tp_is_empty!21469)))

(declare-fun mapNonEmpty!34198 () Bool)

(declare-fun tp!65128 () Bool)

(assert (=> mapNonEmpty!34198 (= mapRes!34198 (and tp!65128 e!542972))))

(declare-fun mapValue!34198 () ValueCell!10253)

(declare-fun mapKey!34198 () (_ BitVec 32))

(declare-fun mapRest!34198 () (Array (_ BitVec 32) ValueCell!10253))

(assert (=> mapNonEmpty!34198 (= (arr!28392 _values!1400) (store mapRest!34198 mapKey!34198 mapValue!34198))))

(declare-fun mapIsEmpty!34198 () Bool)

(assert (=> mapIsEmpty!34198 mapRes!34198))

(declare-fun b!962699 () Bool)

(declare-fun res!644001 () Bool)

(assert (=> b!962699 (=> (not res!644001) (not e!542971))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(assert (=> b!962699 (= res!644001 (and (= (size!28872 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28873 _keys!1686) (size!28872 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!962700 () Bool)

(declare-fun res!643997 () Bool)

(assert (=> b!962700 (=> (not res!643997) (not e!542971))))

(declare-datatypes ((List!19681 0))(
  ( (Nil!19678) (Cons!19677 (h!20845 (_ BitVec 64)) (t!28036 List!19681)) )
))
(declare-fun arrayNoDuplicates!0 (array!59058 (_ BitVec 32) List!19681) Bool)

(assert (=> b!962700 (= res!643997 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19678))))

(declare-fun b!962701 () Bool)

(declare-fun res!643999 () Bool)

(assert (=> b!962701 (=> (not res!643999) (not e!542971))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!962701 (= res!643999 (validKeyInArray!0 (select (arr!28393 _keys!1686) i!803)))))

(assert (= (and start!82702 res!644000) b!962699))

(assert (= (and b!962699 res!644001) b!962696))

(assert (= (and b!962696 res!643998) b!962700))

(assert (= (and b!962700 res!643997) b!962697))

(assert (= (and b!962697 res!643996) b!962701))

(assert (= (and b!962701 res!643999) b!962694))

(assert (= (and b!962693 condMapEmpty!34198) mapIsEmpty!34198))

(assert (= (and b!962693 (not condMapEmpty!34198)) mapNonEmpty!34198))

(get-info :version)

(assert (= (and mapNonEmpty!34198 ((_ is ValueCellFull!10253) mapValue!34198)) b!962695))

(assert (= (and b!962693 ((_ is ValueCellFull!10253) mapDefault!34198)) b!962698))

(assert (= start!82702 b!962693))

(declare-fun m!892915 () Bool)

(assert (=> start!82702 m!892915))

(declare-fun m!892917 () Bool)

(assert (=> start!82702 m!892917))

(declare-fun m!892919 () Bool)

(assert (=> start!82702 m!892919))

(declare-fun m!892921 () Bool)

(assert (=> b!962696 m!892921))

(declare-fun m!892923 () Bool)

(assert (=> b!962700 m!892923))

(declare-fun m!892925 () Bool)

(assert (=> b!962701 m!892925))

(assert (=> b!962701 m!892925))

(declare-fun m!892927 () Bool)

(assert (=> b!962701 m!892927))

(declare-fun m!892929 () Bool)

(assert (=> mapNonEmpty!34198 m!892929))

(check-sat (not b!962700) (not start!82702) (not b!962701) tp_is_empty!21469 (not b!962696) (not mapNonEmpty!34198))
(check-sat)
