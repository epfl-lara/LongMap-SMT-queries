; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36660 () Bool)

(assert start!36660)

(declare-fun res!204550 () Bool)

(declare-fun e!223984 () Bool)

(assert (=> start!36660 (=> (not res!204550) (not e!223984))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36660 (= res!204550 (validMask!0 mask!970))))

(assert (=> start!36660 e!223984))

(assert (=> start!36660 true))

(declare-datatypes ((V!12435 0))(
  ( (V!12436 (val!4293 Int)) )
))
(declare-datatypes ((ValueCell!3905 0))(
  ( (ValueCellFull!3905 (v!6483 V!12435)) (EmptyCell!3905) )
))
(declare-datatypes ((array!20933 0))(
  ( (array!20934 (arr!9938 (Array (_ BitVec 32) ValueCell!3905)) (size!10291 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!20933)

(declare-fun e!223982 () Bool)

(declare-fun array_inv!7370 (array!20933) Bool)

(assert (=> start!36660 (and (array_inv!7370 _values!506) e!223982)))

(declare-datatypes ((array!20935 0))(
  ( (array!20936 (arr!9939 (Array (_ BitVec 32) (_ BitVec 64))) (size!10292 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!20935)

(declare-fun array_inv!7371 (array!20935) Bool)

(assert (=> start!36660 (array_inv!7371 _keys!658)))

(declare-fun b!365755 () Bool)

(declare-fun res!204552 () Bool)

(assert (=> b!365755 (=> (not res!204552) (not e!223984))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!365755 (= res!204552 (and (= (size!10291 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10292 _keys!658) (size!10291 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!365756 () Bool)

(declare-fun res!204554 () Bool)

(assert (=> b!365756 (=> (not res!204554) (not e!223984))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!365756 (= res!204554 (validKeyInArray!0 k0!778))))

(declare-fun mapNonEmpty!14301 () Bool)

(declare-fun mapRes!14301 () Bool)

(declare-fun tp!28377 () Bool)

(declare-fun e!223983 () Bool)

(assert (=> mapNonEmpty!14301 (= mapRes!14301 (and tp!28377 e!223983))))

(declare-fun mapRest!14301 () (Array (_ BitVec 32) ValueCell!3905))

(declare-fun mapValue!14301 () ValueCell!3905)

(declare-fun mapKey!14301 () (_ BitVec 32))

(assert (=> mapNonEmpty!14301 (= (arr!9938 _values!506) (store mapRest!14301 mapKey!14301 mapValue!14301))))

(declare-fun b!365757 () Bool)

(declare-fun tp_is_empty!8497 () Bool)

(assert (=> b!365757 (= e!223983 tp_is_empty!8497)))

(declare-fun b!365758 () Bool)

(declare-fun res!204553 () Bool)

(assert (=> b!365758 (=> (not res!204553) (not e!223984))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!365758 (= res!204553 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10292 _keys!658))))))

(declare-fun b!365759 () Bool)

(declare-fun res!204548 () Bool)

(assert (=> b!365759 (=> (not res!204548) (not e!223984))))

(declare-datatypes ((List!5506 0))(
  ( (Nil!5503) (Cons!5502 (h!6358 (_ BitVec 64)) (t!10647 List!5506)) )
))
(declare-fun arrayNoDuplicates!0 (array!20935 (_ BitVec 32) List!5506) Bool)

(assert (=> b!365759 (= res!204548 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5503))))

(declare-fun b!365760 () Bool)

(declare-fun res!204551 () Bool)

(assert (=> b!365760 (=> (not res!204551) (not e!223984))))

(declare-fun arrayContainsKey!0 (array!20935 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!365760 (= res!204551 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!365761 () Bool)

(assert (=> b!365761 (= e!223984 (and (= (size!10292 _keys!658) (bvadd #b00000000000000000000000000000001 mask!970)) (bvsgt #b00000000000000000000000000000000 (size!10292 _keys!658))))))

(declare-fun b!365762 () Bool)

(declare-fun res!204555 () Bool)

(assert (=> b!365762 (=> (not res!204555) (not e!223984))))

(assert (=> b!365762 (= res!204555 (or (= (select (arr!9939 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!9939 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!365763 () Bool)

(declare-fun res!204549 () Bool)

(assert (=> b!365763 (=> (not res!204549) (not e!223984))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20935 (_ BitVec 32)) Bool)

(assert (=> b!365763 (= res!204549 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!365764 () Bool)

(declare-fun e!223985 () Bool)

(assert (=> b!365764 (= e!223982 (and e!223985 mapRes!14301))))

(declare-fun condMapEmpty!14301 () Bool)

(declare-fun mapDefault!14301 () ValueCell!3905)

(assert (=> b!365764 (= condMapEmpty!14301 (= (arr!9938 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3905)) mapDefault!14301)))))

(declare-fun mapIsEmpty!14301 () Bool)

(assert (=> mapIsEmpty!14301 mapRes!14301))

(declare-fun b!365765 () Bool)

(assert (=> b!365765 (= e!223985 tp_is_empty!8497)))

(assert (= (and start!36660 res!204550) b!365755))

(assert (= (and b!365755 res!204552) b!365763))

(assert (= (and b!365763 res!204549) b!365759))

(assert (= (and b!365759 res!204548) b!365758))

(assert (= (and b!365758 res!204553) b!365756))

(assert (= (and b!365756 res!204554) b!365762))

(assert (= (and b!365762 res!204555) b!365760))

(assert (= (and b!365760 res!204551) b!365761))

(assert (= (and b!365764 condMapEmpty!14301) mapIsEmpty!14301))

(assert (= (and b!365764 (not condMapEmpty!14301)) mapNonEmpty!14301))

(get-info :version)

(assert (= (and mapNonEmpty!14301 ((_ is ValueCellFull!3905) mapValue!14301)) b!365757))

(assert (= (and b!365764 ((_ is ValueCellFull!3905) mapDefault!14301)) b!365765))

(assert (= start!36660 b!365764))

(declare-fun m!362783 () Bool)

(assert (=> b!365756 m!362783))

(declare-fun m!362785 () Bool)

(assert (=> b!365762 m!362785))

(declare-fun m!362787 () Bool)

(assert (=> mapNonEmpty!14301 m!362787))

(declare-fun m!362789 () Bool)

(assert (=> b!365760 m!362789))

(declare-fun m!362791 () Bool)

(assert (=> b!365763 m!362791))

(declare-fun m!362793 () Bool)

(assert (=> start!36660 m!362793))

(declare-fun m!362795 () Bool)

(assert (=> start!36660 m!362795))

(declare-fun m!362797 () Bool)

(assert (=> start!36660 m!362797))

(declare-fun m!362799 () Bool)

(assert (=> b!365759 m!362799))

(check-sat (not b!365763) (not b!365760) (not b!365759) tp_is_empty!8497 (not b!365756) (not start!36660) (not mapNonEmpty!14301))
(check-sat)
