; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82590 () Bool)

(assert start!82590)

(declare-fun b_free!18723 () Bool)

(declare-fun b_next!18723 () Bool)

(assert (=> start!82590 (= b_free!18723 (not b_next!18723))))

(declare-fun tp!65289 () Bool)

(declare-fun b_and!30211 () Bool)

(assert (=> start!82590 (= tp!65289 b_and!30211)))

(declare-fun res!644157 () Bool)

(declare-fun e!542810 () Bool)

(assert (=> start!82590 (=> (not res!644157) (not e!542810))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82590 (= res!644157 (validMask!0 mask!2110))))

(assert (=> start!82590 e!542810))

(assert (=> start!82590 true))

(declare-datatypes ((V!33683 0))(
  ( (V!33684 (val!10813 Int)) )
))
(declare-datatypes ((ValueCell!10281 0))(
  ( (ValueCellFull!10281 (v!13371 V!33683)) (EmptyCell!10281) )
))
(declare-datatypes ((array!59147 0))(
  ( (array!59148 (arr!28442 (Array (_ BitVec 32) ValueCell!10281)) (size!28921 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59147)

(declare-fun e!542806 () Bool)

(declare-fun array_inv!22037 (array!59147) Bool)

(assert (=> start!82590 (and (array_inv!22037 _values!1400) e!542806)))

(declare-datatypes ((array!59149 0))(
  ( (array!59150 (arr!28443 (Array (_ BitVec 32) (_ BitVec 64))) (size!28922 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59149)

(declare-fun array_inv!22038 (array!59149) Bool)

(assert (=> start!82590 (array_inv!22038 _keys!1686)))

(assert (=> start!82590 tp!65289))

(declare-fun tp_is_empty!21525 () Bool)

(assert (=> start!82590 tp_is_empty!21525))

(declare-fun b!962546 () Bool)

(declare-fun e!542808 () Bool)

(assert (=> b!962546 (= e!542808 tp_is_empty!21525)))

(declare-fun b!962547 () Bool)

(declare-fun res!644158 () Bool)

(assert (=> b!962547 (=> (not res!644158) (not e!542810))))

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!962547 (= res!644158 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28922 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28922 _keys!1686))))))

(declare-fun b!962548 () Bool)

(declare-fun res!644161 () Bool)

(assert (=> b!962548 (=> (not res!644161) (not e!542810))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(assert (=> b!962548 (= res!644161 (and (= (size!28921 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28922 _keys!1686) (size!28921 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!962549 () Bool)

(declare-fun e!542809 () Bool)

(declare-fun mapRes!34282 () Bool)

(assert (=> b!962549 (= e!542806 (and e!542809 mapRes!34282))))

(declare-fun condMapEmpty!34282 () Bool)

(declare-fun mapDefault!34282 () ValueCell!10281)

(assert (=> b!962549 (= condMapEmpty!34282 (= (arr!28442 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10281)) mapDefault!34282)))))

(declare-fun b!962550 () Bool)

(declare-fun res!644160 () Bool)

(assert (=> b!962550 (=> (not res!644160) (not e!542810))))

(declare-datatypes ((List!19737 0))(
  ( (Nil!19734) (Cons!19733 (h!20895 (_ BitVec 64)) (t!28100 List!19737)) )
))
(declare-fun arrayNoDuplicates!0 (array!59149 (_ BitVec 32) List!19737) Bool)

(assert (=> b!962550 (= res!644160 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19734))))

(declare-fun b!962551 () Bool)

(assert (=> b!962551 (= e!542809 tp_is_empty!21525)))

(declare-fun mapIsEmpty!34282 () Bool)

(assert (=> mapIsEmpty!34282 mapRes!34282))

(declare-fun mapNonEmpty!34282 () Bool)

(declare-fun tp!65288 () Bool)

(assert (=> mapNonEmpty!34282 (= mapRes!34282 (and tp!65288 e!542808))))

(declare-fun mapRest!34282 () (Array (_ BitVec 32) ValueCell!10281))

(declare-fun mapValue!34282 () ValueCell!10281)

(declare-fun mapKey!34282 () (_ BitVec 32))

(assert (=> mapNonEmpty!34282 (= (arr!28442 _values!1400) (store mapRest!34282 mapKey!34282 mapValue!34282))))

(declare-fun b!962552 () Bool)

(assert (=> b!962552 (= e!542810 false)))

(declare-fun minValue!1342 () V!33683)

(declare-fun defaultEntry!1403 () Int)

(declare-fun lt!430888 () Bool)

(declare-fun zeroValue!1342 () V!33683)

(declare-datatypes ((tuple2!13886 0))(
  ( (tuple2!13887 (_1!6954 (_ BitVec 64)) (_2!6954 V!33683)) )
))
(declare-datatypes ((List!19738 0))(
  ( (Nil!19735) (Cons!19734 (h!20896 tuple2!13886) (t!28101 List!19738)) )
))
(declare-datatypes ((ListLongMap!12583 0))(
  ( (ListLongMap!12584 (toList!6307 List!19738)) )
))
(declare-fun contains!5410 (ListLongMap!12583 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3540 (array!59149 array!59147 (_ BitVec 32) (_ BitVec 32) V!33683 V!33683 (_ BitVec 32) Int) ListLongMap!12583)

(assert (=> b!962552 (= lt!430888 (contains!5410 (getCurrentListMap!3540 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28443 _keys!1686) i!803)))))

(declare-fun b!962553 () Bool)

(declare-fun res!644156 () Bool)

(assert (=> b!962553 (=> (not res!644156) (not e!542810))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!962553 (= res!644156 (validKeyInArray!0 (select (arr!28443 _keys!1686) i!803)))))

(declare-fun b!962554 () Bool)

(declare-fun res!644159 () Bool)

(assert (=> b!962554 (=> (not res!644159) (not e!542810))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59149 (_ BitVec 32)) Bool)

(assert (=> b!962554 (= res!644159 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(assert (= (and start!82590 res!644157) b!962548))

(assert (= (and b!962548 res!644161) b!962554))

(assert (= (and b!962554 res!644159) b!962550))

(assert (= (and b!962550 res!644160) b!962547))

(assert (= (and b!962547 res!644158) b!962553))

(assert (= (and b!962553 res!644156) b!962552))

(assert (= (and b!962549 condMapEmpty!34282) mapIsEmpty!34282))

(assert (= (and b!962549 (not condMapEmpty!34282)) mapNonEmpty!34282))

(get-info :version)

(assert (= (and mapNonEmpty!34282 ((_ is ValueCellFull!10281) mapValue!34282)) b!962546))

(assert (= (and b!962549 ((_ is ValueCellFull!10281) mapDefault!34282)) b!962551))

(assert (= start!82590 b!962549))

(declare-fun m!892169 () Bool)

(assert (=> mapNonEmpty!34282 m!892169))

(declare-fun m!892171 () Bool)

(assert (=> b!962553 m!892171))

(assert (=> b!962553 m!892171))

(declare-fun m!892173 () Bool)

(assert (=> b!962553 m!892173))

(declare-fun m!892175 () Bool)

(assert (=> b!962554 m!892175))

(declare-fun m!892177 () Bool)

(assert (=> b!962550 m!892177))

(declare-fun m!892179 () Bool)

(assert (=> start!82590 m!892179))

(declare-fun m!892181 () Bool)

(assert (=> start!82590 m!892181))

(declare-fun m!892183 () Bool)

(assert (=> start!82590 m!892183))

(declare-fun m!892185 () Bool)

(assert (=> b!962552 m!892185))

(assert (=> b!962552 m!892171))

(assert (=> b!962552 m!892185))

(assert (=> b!962552 m!892171))

(declare-fun m!892187 () Bool)

(assert (=> b!962552 m!892187))

(check-sat (not b!962552) b_and!30211 tp_is_empty!21525 (not mapNonEmpty!34282) (not b_next!18723) (not b!962550) (not b!962553) (not start!82590) (not b!962554))
(check-sat b_and!30211 (not b_next!18723))
